<div class="hero-image">
    <div class="frame">
        <img src="assets/duartejunior.png" alt="Banner do Módulo 4 - Introdução a Python">
    </div>
</div>

# Módulo 4 - Introdução a Python

Anotações da aula sobre os fundamentos de Python (recapitulação, funções, módulos, Pandas, debugging, classes e organização de projetos). Instrutor: Duarte Junior (AI Engineer na Indicium).

## Ferramenta usada

Pra rodar os códigos eu usei o **VSCode**, com um ambiente virtual (`venv`) criado pra isolar os pacotes da aula (tipo o `pandas`) sem instalar nada direto na minha máquina.

```bash
# Bash
python -m venv venv
source venv/bin/activate
pip install pandas

# Windows
python -m venv venv
.env\Scripts\Activate
pip install pandas
```

## O que aprendi

**O que é Python**

Python é uma linguagem interpretada, orientada a objetos e de alto nível, com tipagem dinâmica. Isso facilita muito o desenvolvimento rápido de aplicações e também serve como "cola" pra conectar outros componentes. Os pontos que mais me chamaram atenção pra aprender Python: fácil aprendizado, é meio que o "inglês da programação", desenvolvimento rápido e é gratuita.

**Recapitulando: o que já tínhamos visto**

Antes de entrar em conteúdo novo, revisamos rapidamente: `print("Hello World!")`, variáveis, **Python dataclasses**, condicionais e loops.

**Recapitulando: tipos de dados**

- **Text type**: `str`
- **Numeric types**: `int`, `float`, `complex`
- **Sequence types**: `list`, `tuple`, `range`
- **Mapping type**: `dict`
- **Set type**: `set`, `frozenset`
- **Boolean type**: `bool`
- **Binary types**: `bytes`, `bytearray`, `memoryview`
- **None type**: `NoneType`

**Recapitulando: operações com strings**

- `str.capitalize()` → primeira letra maiúscula → `str`
- `str.upper()` / `str.lower()` ou `casefold()` → caixa alta/baixa → `str`
- `str.split(separator, maxsplit)` → separa a string → `list`
- `separator.join(iterable)` → une elementos de uma lista numa string → `str`
- `str.count(value, start, end)` → conta ocorrências → `int`
- `str.replace(oldvalue, newvalue, count)` → substitui valores → `str`
- E o mais importante: **string formatting** com `str.format(value1, value2...)` ou f-strings (`f"my string with {value}"`)

**Recapitulando: operadores**

- **Assignment**: `=`, `+=`, `-=`, `*=`, `/=`
- **Aritméticos**: `+` (soma), `-` (subtração), `*` (multiplicação), `/` (divisão, sempre retorna `float`), `%` (módulo/resto), `**` (exponenciação), `//` (divisão inteira)
- **Comparison**: `==`, `!=`, `>`, `<`, `>=`, `<=`
- **Logical**: `and`, `or`, `not`
- **Identity**: `is`, `is not`
- **Membership**: `in`, `not in`

📝 Dever de casa que ficou passado: pesquisar sobre **operator precedence** (ordem de prioridade entre os operadores quando aparecem juntos numa mesma expressão).

**Recapitulando: tipos de sequência**

- **Tuples `()`**: ordenadas, imutáveis, permitem duplicatas. Acesso: `tuple[i]`. Métodos: `count()`, `index()`, `len()`
- **Lists `[]`**: ordenadas, mutáveis, permitem duplicatas. Acesso: `list[i]` ou `list[range]`. Métodos: `append()`, `count()`, `index()`, `insert()`, `pop()`, `remove()`, `sort()`
- **Dicts `{k: v}`**: guardam dados em chave/valor, mutáveis e não permitem chaves duplicadas. Acesso: `dict[key]` ou `dict.get(key)`. Método: `pop(keyname)`

**Recapitulando: type casting**

`int()`, `float()`, `str()`, `list()` — pra converter um tipo de dado em outro.

**Recapitulando: condicionais e loops**

```python
if condicao1:
    declaracao
elif condicao2:
    outra_declaracao
else:
    declaracao_sem_condicao
```

Loops: `for i in iterable`, `for i in range(start, stop, step)`, `for key, value in my_dict.items()`, `enumerate()` e `while` (com `continue` e `break`).

## Funções e pseudocódigo

**Funções**

```python
def my_func(params):
    return or action

my_func(args)  # não esquecer de chamar a função!
```

- Quantidade indefinida de argumentos posicionais (vira tupla): `def my_func(*args):`
- Quantidade indefinida de argumentos nomeados (vira dict): `def my_func(**kwargs):`
- A ordem dos argumentos importa. Se for chamar fora de ordem, precisa nomear: `my_func(arg1=arg1, arg3=arg3, arg2=arg2)`

**Pseudocódigo**

É a linha de raciocínio que serve de base pro código antes de escrever a função de fato. Ajuda a organizar a lógica e se acostumar a pensar como a linguagem antes de programar. Fiz um exercício de "verificador de idade" com essa lógica (arquivo [`pseudocodigo.py`](./aula%201/pseudocodigo.py)).

## Módulos e Pacotes

- **Módulos**: arquivos `.py` que contêm funções pra incluir em outras aplicações.
- **Pacotes**: diretórios com múltiplos módulos ou subpacotes.
  - Standard Library: `math`, `os`, `json`, `datetime`...
  - Externos: `pandas`, `numpy`, `requests`...
- **Venvs**: ambientes virtuais onde instalamos os pacotes de uma aplicação, sem afetar a máquina toda.

## Introdução a Pandas

Definição oficial: *pandas is a fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language.*

- Dados tabulares em memória (linhas/colunas)
- Estruturas: `Series` (1D) e `DataFrame` (2D)
- Fluxo de hoje: ler csv/json → inspecionar → selecionar/filtrar

**Ler e inspecionar dados**

- `pd.read_csv()` → carrega dados tabulares em `DataFrame`
- `df.head()` → mostra as primeiras linhas
- `df.shape` → tamanho (linhas x colunas)
- `df.columns` → nomes das colunas
- `df.info()` → tipos de dados e valores ausentes

💡 Dica que o instrutor reforçou: antes de manipular os dados, sempre fazer uma leitura inicial pra entender o formato e evitar erro.

## Operações com Pandas (o "SQL do Python")

Uma tabela comparativa que ajudou muito a entender Pandas por analogia com SQL:

| SQL | Pandas |
|---|---|
| `SELECT * FROM table` | `df` ou `df.head()` |
| `SELECT col1, col2` | `df[['col1', 'col2']]` |
| `WHERE col > 5` | `df[df['col'] > 5]` |
| `GROUP BY col` | `df.groupby('col')` |
| `COUNT(*)` | `df.shape[0]` ou `df['col'].count()` |
| `DISTINCT` | `.unique()` |
| `SUM(col)` / `AVG(col)` | `df['col'].sum()` / `df['col'].mean()` |
| `JOIN` | `pd.merge(df1, df2, on='key')` |
| `UNION` | `pd.concat([df1, df2])` |
| `LIMIT n` | `df.head(n)` |
| `IS NULL` / `IS NOT NULL` | `df['col'].isnull()` / `.notnull()` |
| `IN ('a', 'b')` | `df['col'].isin(['a', 'b'])` |
| `LIKE '%pattern%'` | `df['col'].str.contains('pattern')` |
| `ALTER TABLE ADD COLUMN` | `df['new_col'] = ...` |
| `UPDATE` | `df.loc[condition, 'col'] = new_value` |
| `DELETE FROM table WHERE ...` | `df = df[~condition]` |

## Pandas x Polars x Pyspark

Ficou claro que a escolha depende do tamanho dos dados:

| Feature | Pandas | PySpark | Polars |
|---|---|---|---|
| Facilidade de uso | Excelente | Moderada | Boa |
| Performance | Moderada | Alta (big data) | Alta |
| Escalabilidade | Baixa | Excelente | Boa |
| Paralelismo | Baixo | Alto | Alto |

Frase que resume bem a diferença entre modo eager e lazy: rodar em modo eager é como "cozinhar conforme vai fazendo", enquanto o modo lazy é como planejar a receita toda antes, com tudo já otimizado. No benchmark mostrado em aula (2,5 milhões de linhas), Polars (tanto lazy quanto eager) foi o mais rápido, seguido de PySpark, com Pandas bem atrás dos três.

## Debugging

Usamos o debugger do VSCode pra achar um bug intencional numa função de cálculo de média de idades — o erro estava relacionado a um valor vindo como string dentro de uma lista de números. Serviu pra treinar o hábito de rodar passo a passo e inspecionar variáveis em vez de só ler o código.

## Classes

```python
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def exibir_info(self):
        status = "Adulto" if self.age >= 18 else "Menor"
        print(f"Usuário: {self.name} | Idade: {self.age} | Status: {status}")
```

Vimos também conceitos de orientação a objetos:

- **Encapsulamento**: atributos "privados" com `__` (dois underlines), acessados só por métodos da própria classe (ex.: `verificar_senha`, `get_balance`).
- **Herança**: uma classe (`Humano`, `Cachorro`) herda atributos e métodos de uma classe base (`Mamifero`) usando `super().__init__()`.
- **Polimorfismo**: classes diferentes que compartilham uma mesma base podem implementar o mesmo método (`speak()`) de formas diferentes.

## Princípios de organização de projetos

- Código limpo e legível
- Separação de funções (cada uma faz uma coisa só)
- Atomicidade (relativo)
- Testes (o programador não fica só pensando se vai funcionar, testa)
- Documentação (em código e em READMEs)
- Versionamento (Git)
- Aproximação ao ambiente de produção

## Exercícios que fez

Separei os códigos por aula:

**Aula 1** — pasta [`aula 1`](./aula%201)

- [`pseudocodigo.py`](./aula%201/pseudocodigo.py) — verificador de idade a partir de pseudocódigo
- [`loop_em_batches.py`](./aula%201/loop_em_batches.py) — percorrer uma lista em lotes (batches)
- [`args_kwargs.py`](./aula%201/args_kwargs.py) — funções com `*args` e `**kwargs`
- [`arg_order.py`](./aula%201/arg_order.py) — ordem de argumentos posicionais vs nomeados
- [`utils.py`](./aula%201/utils.py) + [`moduled_file.py`](./aula%201/moduled_file.py) — separando uma função em módulo próprio e importando em outro arquivo
- [`packages.py`](./aula%201/packages.py) + [`convidados.json`](./aula%201/convidados.json) — usando `os` e `json` pra gerar convites em `.txt` a partir de uma lista de convidados
- [`pandas_practice.py`](./aula%201/pandas_practice.py) + [`order_details.csv`](./aula%201/order_details.csv) + [`public-orders (1).jsonl`](./aula%201/public-orders%20(1).jsonl) — ler CSV e JSONL, dar merge, filtrar e exportar resultado
  > Rodar esse script gera um `customers_above_100.csv` na mesma pasta — é o output do exercício, não precisa subir ele pro Git (dá pra colocar no `.gitignore`).
- [`classes.py`](./aula%201/classes.py) — herança com `Mamifero`, `Humano` e `Cachorro`
- [`encapsulation.py`](./aula%201/encapsulation.py) — encapsulamento com `BankAccount`
- [`polymorphism.py`](./aula%201/polymorphism.py) — polimorfismo com `Animal` e `Dog`

**Aula 2** — pasta [`aula 2`](./aula%202)

- [`s26_pratica_modulos.py`](./aula%202/s26_pratica_modulos.py) — usando `math`, `os` e `datetime`
- [`s30_operacoes_inspecao_pandas.py`](./aula%202/s30_operacoes_inspecao_pandas.py) — criando um `DataFrame` a partir de um dicionário e filtrando por departamento
- [`s32_ler_inspecionar.py`](./aula%202/s32_ler_inspecionar.py) — lendo [`teste.csv`](./aula%202/teste.csv) e inspecionando com `head()`, `shape`, `columns` e `info()`
- [`s33_operacoes_pandas.py`](./aula%202/s33_operacoes_pandas.py) — `WHERE`, `GROUP BY`, `ORDER BY` e criação de coluna nova, tudo em Pandas
- [`s38_debugger.py`](./aula%202/s38_debugger.py) — bug intencional pra praticar no debugger do VSCode
- [`s39_classes.py`](./aula%202/s39_classes.py) — classe `User` simples
- [`s40_codigo_limpo.py`](./aula%202/s40_codigo_limpo.py) — mesma classe `User`, mas com senha "privada" e métodos separados (boas práticas)

## Pra lembrar depois

- Pandas é tipo o SQL do Python: `df[df['col'] > 5]` é o `WHERE`, `groupby()` é o `GROUP BY`
- Pra big data, Polars e PySpark escalam muito melhor que Pandas
- Atributo "privado" em Python é convenção (`__nome`), não é 100% travado
- Herança usa `super().__init__()` pra reaproveitar o `__init__` da classe base
- Antes de codar, vale a pena escrever o pseudocódigo
- Separar funções em módulos (`utils.py`) deixa o projeto mais organizado e testável
