<div class="hero-image">
    <div class="frame">
        <img src="assets/luishenrique.png" alt="Banner do Módulo 5 - Fundamentos de Controle de Versão">
    </div>
</div>

# Módulo 5 - Fundamentos de Controle de Versão

Anotações da aula sobre terminal, bash e controle de versão com Git. Instrutor: Luis Henrique (Luisinho), Data Engineer Manager na Indicium.

## O que aprendi

**O que é um terminal**

Antigamente a entrada de dados de um computador era feita por um Terminal de verdade: só um monitor e um teclado, ligados a uma máquina mais robusta que processava tudo. Era por ali que se acessava o sistema e navegava nos diretórios digitando comando em vez de clicar com o mouse.

Hoje, quando eu abro o "Terminal" no meu computador, na real eu tô abrindo um programa que **emula** essa máquina antiga. Existem vários desses programas, o sistema operacional já vem com um, mas dá pra instalar outro se eu quiser.

**Shell**

O Shell é o programa que faz a ponte entre eu (usuário) e o núcleo do sistema operacional. É ele quem interpreta o comando que eu digito e manda pro Kernel executar.

Fluxo que ficou mais claro pra mim:
```
Programa que emula terminal ($ ls) → Shell (interpreta o comando) → Kernel → Hardware
```

Tem dois tipos de shell:
- **CLI** (Command Line Interface) → baseado em linha de comando, preciso digitar tudo
- **GUI** (Graphical User Interface) → interface gráfica, tipo o Windows Explorer

E no Linux o shell mais usado é o **BASH** (Bourne Again Shell), que é o padrão de login na maioria das distros (dá pra instalar no Windows também). No Windows já vem o Powershell e o Command Line.

## Comandos básicos de terminal

Separei os comandos que testei em aula:

```bash
pwd                     # mostra o diretório atual
ls -a                   # lista tudo, incluindo ocultos
ls --help               # ajuda do comando
cd meu_projeto          # navega entre diretórios
mkdir meu_projeto       # cria um diretório novo
rmdir pasta_vazia       # remove diretório vazio e seguro
rm arquivo.txt          # remove arquivo (cuidado, é permanente)
rm -r pasta_com_arquivos # remove pasta que tem arquivo dentro
cp origem.txt copia.txt # copia arquivo
mv antigo.txt novo.txt  # move ou renomeia
cat arquivo.txt         # mostra o conteúdo do arquivo
less arquivo.txt        # mostra com paginação (Q pra sair)
grep "termo" arquivo.txt # filtra conteúdo com regex
echo $nome              # exibe texto ou variável
sudo apt-get install x  # instala pacote como superusuário
curl -X GET "https://api.bcb.gov.br/dados/serie/bcdata.sgs.10813/dados?formato=json"
ps                       # processos em execução
kill 1234                # mata processo pelo ID
history                  # histórico de comandos
```

Também existem `chmod` (mexer em permissão) e `chown` (mudar dono do arquivo), mas não usei tanto em aula.

## Controle de versão — de onde veio o Git

Isso eu não sabia: o Git foi criado em **2005** pelo Linus Torvalds, o mesmo cara que criou o kernel do Linux. Antes disso a comunidade do kernel usava o **BitKeeper** como sistema de controle de versão, mas rolou um rompimento de relações e o Linus resolveu criar o próprio sistema, usando a experiência que teve com o BitKeeper.

As metas dele eram: velocidade, suporte a desenvolvimento não-linear, ser distribuído e conseguir lidar com projetos grandes de forma eficiente. Hoje o Git é o sistema de controle de versão mais usado do mundo.

## Termos que preciso lembrar

- **Repositório** → diretório onde ficam os arquivos do projeto (código, imagem, o que for). Pode ser local (na minha máquina) ou remoto (GitHub, GitLab, Bitbucket, Azure DevOps).
- **Branch** → uma ramificação do código. Serve pra eu desenvolver uma feature sem mexer direto na versão que já tá funcionando em produção.
- **Commit** → um conjunto de alterações salvo, com autor, mensagem e um hash único. É esse hash que deixa eu voltar pra um ponto específico do histórico.
- **Pull Request** → o pedido que eu faço pro dono do repositório aceitar minhas alterações no projeto oficial.
- **Clone** → cópia local de um repositório remoto, pra eu trabalhar nele e depois mandar as alterações de volta.
- **Fork** → um repositório novo, independente, que copia o "upstream" original. Usado quando não tenho permissão de escrita no projeto original (comum em open source).

## GitFlow

O modelo de branches que a aula usou como referência:

- `main` → versão estável, em produção
- `develop` → onde as features vão sendo integradas
- `feature/*` → desenvolvimento de funcionalidade nova
- `release/*` → preparação de uma versão
- `hotfix/*` → correção urgente aplicada direto em cima da `main`

## Como o repositório local conversa com o remoto

```
Workspace → Index/Staging → Local Repository → Remote Repository
```

- `git init` / `git clone` inicializam o repositório
- `git pull` / `git fetch` trazem o que mudou no remoto
- `git add` / `git commit` registram mudança localmente
- `git push` manda o commit local pro remoto
- `git checkout` / `git diff` navegam e comparam versões

## Comandos de Git que testei

Separei tudo num roteiro pra praticar em [`comandos-git-hands-on.sh`](./comandos-git-hands-on.sh). Aqui vai o resumo:

**Configuração e conexão**
```bash
git init                          # inicializa o repositório
git remote -v                     # lista os remotos vinculados
git remote add origin <url>       # adiciona um remoto
git remote remove origin          # remove um remoto
git clone <url>                   # clona um repositório existente
```

**Branches**
```bash
git branch                # lista as branches
git branch feature/login  # cria uma branch
git branch -D feature/login # apaga uma branch
git branch -m novo-nome   # renomeia a branch atual
git checkout feature/login   # muda pra branch
git checkout -b feature/login # cria e já muda pra branch
```

**Alterações**
```bash
git status                 # o que mudou
git add arquivo.txt        # manda arquivo pra staging area
git add .                  # manda tudo pra staging area
git reset                  # volta staging pro último commit (--hard reseta workspace também, cuidado)
git revert <hash>          # desfaz um commit criando outro commit (bom pra histórico remoto/público)
git restore arquivo.txt    # descarta alteração não commitada
git diff                   # diferença entre workspace e staging
```

**Commit e histórico**
```bash
git commit -m "mensagem"       # cria o commit
git commit -a -m "mensagem"    # pula o add, mas só funciona pra arquivo já rastreado
git log                        # histórico de commits
git log --oneline              # histórico resumido
git shortlog                   # histórico agrupado por autor
git reflog                     # histórico de ações no repositório
```

**Sincronização**
```bash
git push -u origin feature/login  # manda a branch pro remoto
git pull origin main               # traz o que mudou na main
```

## .gitignore

Arquivo simples que diz pro Git quais arquivos/pastas ele nunca deve versionar. Motivos pra usar:

- **Segurança** → não deixa subir senha, chave de API, `.env`
- **Limpeza** → não polui o repositório com pasta de biblioteca tipo `venv/` ou `node_modules/`
- **Performance** → só o código essencial é versionado, deixando `push`/`pull` mais rápido

Deixei um exemplo pronto em [`.gitignore.example`](./.gitignore.example) (é só renomear pra `.gitignore` na raiz do projeto).

## Pra lembrar depois
- Terminal hoje é um programa que emula a máquina antiga; Shell é quem faz a ponte com o Kernel
- BASH é o shell padrão do Linux, Powershell/CMD é do Windows
- O Git nasceu em 2005 por causa do rompimento com o BitKeeper
- Branch ramifica o código, commit salva o estado, pull request pede pra integrar
- Fluxo local: Workspace → Staging → Local Repository → Remote Repository
- `.gitignore` é essencial pra não subir segredo nem lixo pro repositório
- Rodar `git status` sempre antes de commitar evita surpresa

## Referências
- [Learn Git Branching](https://learngitbranching.js.org/) — simulador interativo pra praticar Git
- [Documentação oficial do Git](https://git-scm.com/doc)