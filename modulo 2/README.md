<div class="hero-image">
    <div class="frame">
        <img src="assets/Yasmim Lima.png" alt="Banner do Módulo 2 - Fundamentos de Controle de Versão">
    </div>
</div>

# Módulo 2 - Introdução à Programação

Anotações da aula sobre os fundamentos de programação. Instrutora: Yasmim Lima (Data Engineer na Indicium).

## O que aprendi

**Como o computador funciona**

O computador basicamente executa tarefas lógicas e matemáticas, guarda e busca dados na memória, e faz tudo isso em operações bem simples (baixo nível). No fundo é tudo matemática.

A parte mais louca é que ele só entende **0 e 1** (ligado/desligado). Todo vídeo, imagem, texto que a gente vê é traduzido pra uma sequência gigante de 0s e 1s.

**Quem inventou tudo isso**

- Ada Lovelace foi a primeira programadora da história
- Alan Turing criou o conceito das Máquinas de Turing
- John Von Neumann criou a arquitetura de computador com memória (a que usamos até hoje)

**O que é um algoritmo**

É simplesmente uma sequência de passos lógicos pra resolver um problema. A professora deu o exemplo de uma receita de bolo ou de como trocar um pneu — no fundo é a mesma lógica de um programa.

**Por que a gente vai aprender Python**

- Sintaxe parecida com inglês, mais fácil de ler
- Não fica cheio de `{}` e `;` toda hora como outras linguagens
- É a linguagem mais usada em IA e Ciência de Dados hoje em dia

```python
print("Hello World!")
```

## Variáveis

Pensei nelas como etiquetas/caixinhas que guardam um valor na memória RAM. Quando eu mudo o valor, ele não desaparece, só é substituído por um novo.

```python
nome = "Alan Turing"   # string (texto)
idade = 53              # int (número inteiro)
altura = 1.80            # float (número com decimal)
```

## If / Else (lógica de decisão)

O computador só faz uma coisa se a condição for verdadeira, senão ele faz outra.

```python
if chuva == True:
    print("levar guarda chuvas")
else:  # ou if chuva == False:
    print("sair de boa")
```

## For e While (loops)

Serve pra repetir uma ação sem precisar escrever ela um monte de vezes. A ideia é: "deixa o tédio pra máquina".

```python
num = int(input("Digite um número para ver a tabuada: "))
print(f"Tabuada do {num}:")

# usando for
for i in range(1, 11):
    resultado = num * i
    print(f"{num} x {i} = {resultado}")

# usando while (mesma coisa, jeito diferente)
i = 1
while i != 11:
    resultado = num * i
    print(f"{num} x {i} = {resultado}")
    i = i + 1
```

## Funções

A ideia é não ficar repetindo código (isso tem até nome: princípio **DRY** - Don't Repeat Yourself). Eu junto um bloco de código dentro de uma função com nome, e só chamo ela quando precisar.

Exemplo que ficou bem claro: uma função de fazer café, onde entram os ingredientes e sai o café pronto.

```python
def fazer_cafe(tipo_cafe, quantidade_agua, acucar):
    print(f"Aquecendo {quantidade_agua}ml de água")
    print(f"Adicionando {tipo_cafe}")
    print(f"Adicionando {acucar} colheres de açúcar")
    print("Café pronto!")

fazer_cafe("café expresso", 50, 1)
fazer_cafe("café coado", 200, 2)
```

## Indentação

Isso é uma coisa que preciso lembrar sempre: em Python o espaço/tab no início da linha **não é estética**, ele define o que está dentro de cada bloco de código. Se eu errar a indentação, o código quebra ou funciona errado.

## Declarativo x Imperativo

- **Declarativo** (ex: SQL): eu digo o que eu quero, o computador decide como buscar
- **Imperativo** (ex: Python): eu descrevo passo a passo o que ele deve fazer

```sql
-- eu só digo o que quero
select nome from clientes where idade > 18
```

```python
# aqui eu descrevo o passo a passo
clientes_maiores = []
for cliente in clientes:
    if cliente["idade"] > 18:
        clientes_maiores.append(cliente["nome"])
```

## Compilador x Interpretador

- **Compilador**: traduz o código inteiro de uma vez antes de rodar (tipo traduzir um livro inteiro). Exemplos: C, C++, Rust
- **Interpretador**: vai traduzindo linha por linha enquanto roda (tradução simultânea). Exemplos: Python, JavaScript (Python usa esse)

## Jogos pra praticar (indicados na aula)
- The Farmer Was Replaced
- Turing Complete
- While True: Learn()
- Joy of Programming

## Dicas que a Yasmim deu pra continuar evoluindo

1. **Praticar sempre** — é que nem tocar um instrumento, quanto mais eu pratico mais natural fica. Ela indicou HackerRank, LeetCode e DataLemur pra treinar.
2. **Resolver problemas do meu dia a dia** — tipo automatizar alguma tarefa chata, calcular gastos, ou resolver algo que eu já preciso resolver de verdade.
3. **Usar IA pra aprender, não pra pensar por mim** — posso usar pra entender conceito ou revisar código, mas o raciocínio tem que ser meu. Dica dela: usar o NotebookLM ou tentar explicar pra IA o que eu aprendi.

## Exemplos que fiz
Separei os códigos dessa aula na pasta [`exemplos/`](./exemplos):
- `variaveis.py`
- `condicional.py`
- `loops.py`
- `funcoes.py`

## Desafio que fiz misturando os conceitos

A professora passou um desafio pra misturar `input`, f-string e `if/elif/else`: pedir nome, cidade e idade da pessoa, e verificar se ela pode entrar numa montanha-russa (com base na idade).

Ficou assim: [`desafio_montanha_russa.py`](./exemplos/desafio_montanha_russa.py)

```python
nome = input('Digite seu nome: ')
cidade = input('Em qual cidade você mora? ')
print(f'bem-vindo {nome} de {cidade}, obrigado por visitar a montanha-russa radical')

idade = input("Qual sua idade? ")
idade = int(idade)
if idade < 17:
    print("Você não pode entrar na montanha-russa.")
elif idade == 17:
    print("falta um pouco para crescer e entrar na montanha-russa.")
else:
    print("Você pode entrar na montanha-russa.")
```