<div class="hero-image">
    <div class="frame">
        <img src="assets/corinabachmann.png" alt="Banner do Módulo 3 - Introdução à SQL">
    </div>
</div>


# Módulo 3 - Introdução à SQL

Anotações da aula sobre os fundamentos de SQL. Instrutora: Corina Bachmann (Team Lead Analytics Engineer na Indicium).

## Ferramenta usada

Pra rodar as queries eu usei o [DBeaver](https://dbeaver.io/), conectado ao banco [Northwind em SQLite](./Northwind_small.sqlite). Nunca tinha usado essa ferramenta antes e achei bem legal — é bem intuitiva pra explorar as tabelas, ver a estrutura do banco e rodar os scripts direto na interface.

## O que aprendi

**O que é SQL**

SQL (Structured Query Language) é a linguagem que a gente usa pra conversar com um banco de dados. Ela serve basicamente pra três coisas: consultar dados (buscar informação com filtros), manipular tabelas (inserir, atualizar, apagar) e gerenciar o banco (criar estrutura, controlar permissões).

O fluxo que ficou mais claro pra mim foi esse: eu (usuário) mando uma pergunta em SQL pra aplicação, a aplicação executa isso no banco de dados, e o banco devolve a informação de volta pra mim. É tipo pedir uma informação num balcão e alguém ir lá no arquivo buscar pra mim.

**Modelo relacional**

Foi criado nos anos 1970 (Edgar Frank Codd) e está em praticamente todo sistema empresarial hoje. A ideia central é que os dados ficam organizados em tabelas, e essas tabelas podem se relacionar entre si através de chaves (tipo um ID que aparece em mais de uma tabela).

Cada linha de uma tabela é um **registro**, cada coluna é um **campo**, e cada coluna tem um tipo de dado específico (texto, número, data, etc).

**Os "4 subconjuntos" da SQL**

Isso eu não sabia e achei interessante — SQL não é só o `SELECT`, ela se divide em:

- **DDL** (Definição de Dados): `CREATE`, `ALTER`, `DROP` → cria/altera/apaga tabelas
- **DML** (Manipulação de Dados): `SELECT`, `INSERT`, `UPDATE`, `DELETE` → é o que a gente mais usa no dia a dia
- **DCL** (Controle de Dados): `GRANT`, `REVOKE` → controla permissão de acesso
- **DTL** (Controle de Transações): `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`

## SELECT básico

A estrutura mais simples é: eu escolho quais colunas eu quero e de qual tabela.

```sql
select nome_coluna from nome_tabela
```

Se eu quiser todas as colunas, uso `*`. Se eu quiser só valores únicos (sem repetição), uso `distinct`.

```sql
select * from clientes
select distinct Name from clientes
```

## ORDER BY e LIMIT

`ORDER BY` ordena o resultado (por padrão do menor pro maior, ou uso `desc` pra inverter). `LIMIT` corta quantas linhas eu quero ver. Uma coisa importante que a professora reforçou: **a ordem das cláusulas importa** — não dá pra escrever `LIMIT` antes de `ORDER BY`, por exemplo.

```sql
select *
from clientes
order by cod_cliente desc
limit 2
```

## WHERE e os operadores

`WHERE` é o filtro da consulta. Aprendi 3 tipos de operadores:

- **Comparação**: `=`, `>`, `<`, `>=`, `<=`, `<>` (diferente)
- **Lógicos**: `AND`, `OR`, `IN`, `NOT`, `BETWEEN`, `LIKE`
- **Aritméticos**: `+`, `-`, `*`, `/` (dá pra fazer conta direto na query, tipo calcular preço total)

Detalhe que anotei pra não esquecer: **texto e data usam aspas simples** (`'PF'`), **número não usa aspas** (`id = 10`).

```sql
select *
from clientes
where tipo_cliente = 'PF'

select primeiro_nome, cod_cliente, uf
from clientes
where uf in ('PR', 'SP', 'MG')

select primeiro_nome, cod_cliente, uf
from clientes
where data_cadastro between '01/01/2024' and '01/01/2025'
```

## Funções de agregação

Servem pra resumir os dados em vez de mostrar linha por linha. Geralmente uso junto com `GROUP BY` pra agrupar por alguma coluna.

- `SUM` → soma
- `COUNT` → conta quantos registros (ignora nulos, exceto com `*`)
- `AVG` → calcula média
- `MAX` / `MIN` → maior e menor valor

```sql
select productid, sum(quantity)
from orders
group by productid
```

## JOIN — juntando tabelas

Isso foi a parte que exigiu mais atenção. `JOIN` serve pra combinar colunas de tabelas diferentes que têm alguma relação (tipo `clientes` e `pedidos`).

- **INNER JOIN**: só traz o que existe nas duas tabelas
- **LEFT JOIN**: traz tudo da tabela da esquerda, mesmo sem correspondência (vira `NULL`)
- **RIGHT JOIN**: o mesmo, só que priorizando a tabela da direita
- **FULL JOIN**: traz tudo dos dois lados
- **CROSS JOIN**: combina todas as linhas de uma tabela com todas da outra (produto cartesiano)

```sql
select
  clientes.Nome,
  pedidos.Data
from pedidos
inner join clientes
on pedidos.ClienteID = clientes.ID
```

## UNION — empilhando resultados

Diferente do `JOIN` (que junta colunas), o `UNION` empilha linhas de duas consultas diferentes, desde que tenham o mesmo número de colunas. `UNION` remove duplicados, `UNION ALL` mantém tudo.

```sql
select * from pedidos_1
union
select * from pedidos_2
```

## Ordem completa de uma query

Ficou faltando eu decorar a ordem certa das cláusulas, então anotei aqui pra consultar depois:

```sql
SELECT coluna_1, coluna_2, ...
FROM tabela_1
JOIN tabela_2 ON tabela_1.fk = tabela_2.pk
WHERE condições
GROUP BY coluna_1, coluna_2, ...
HAVING condições (agregadas)
ORDER BY coluna_1, coluna_2 desc, ...
LIMIT número_de_linhas
```

## Exercícios que fiz

A aula usou o banco **Northwind** (importadora fictícia de alimentos) com um cenário **fictício** de onboarding, proposto pela instrutora: eu como analista júnior precisando responder perguntas de uma CEO (que não existe de verdade, é só pra simular uma situação real de trabalho). Os exercícios foram feitos junto com a instrutora, durante a aula. Separei minhas queries em [`script.sql`](./script.sql).

**Task A** — nome e preço de todos os produtos:
```sql
select ProductName, UnitPrice
from Product
order by UnitPrice desc;
```

**Task B** — produtos com mais de 20 unidades em estoque e que custam mais de 50 reais:
```sql
select ProductName, UnitPrice, UnitsInStock
from Product p
where p.UnitsInStock > 20
and p.UnitPrice > 50;
```

**Task C** — valor total vendido por produto e valor médio dos pedidos:
```sql
select ProductId, sum(UnitPrice * Quantity) as valorTotal
from OrderDetail
group by ProductId
order by valorTotal;

select avg(UnitPrice * Quantity) as valorMedio
from OrderDetail;
```

**Task D** — trocar o ID da categoria pelo nome (precisei de um `JOIN` aqui):
```sql
select Product.ProductName, Product.CategoryId, Category.CategoryName
from Product
inner join Category
on Product.CategoryId = Category.Id
order by Category.CategoryName;
```

## Pra lembrar depois
- A ordem das cláusulas SQL importa (`SELECT` → `FROM` → `JOIN` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`)
- Texto/data usa aspas simples, número não usa
- `JOIN` combina colunas, `UNION` empilha linhas
- Nem todo banco de dados suporta `FULL JOIN`
