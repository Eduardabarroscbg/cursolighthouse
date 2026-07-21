#!/bin/bash
# =============================================================
# Hands-on: Terminal, Bash e Git — Fundamentos de Controle de Versão
# Execute cada bloco separadamente para praticar (não rode tudo de uma vez).
# =============================================================

# ---------- 1. Comandos básicos de terminal ----------
pwd                     # mostra o diretório atual
ls -a                   # lista todos os arquivos, incluindo ocultos
mkdir meu_projeto       # cria um novo diretório
cd meu_projeto          # entra no diretório
echo "ola mundo" > arquivo.txt   # cria um arquivo com conteúdo
cat arquivo.txt         # exibe o conteúdo do arquivo
cp arquivo.txt copia.txt         # copia o arquivo
mv copia.txt renomeado.txt       # renomeia/move o arquivo
grep "ola" arquivo.txt  # filtra linhas que contenham "ola"
rm renomeado.txt        # remove um arquivo

# ---------- 2. Inicializando um repositório Git ----------
git init                                   # inicializa o repositório local
git remote add origin <URL_DO_REPOSITORIO> # vincula um repositório remoto
git remote -v                              # confirma o remoto vinculado

# ---------- 3. Criando e alternando branches ----------
git branch                     # lista as branches existentes
git checkout -b feature/login  # cria e muda para a branch "feature/login"

# ---------- 4. Registrando alterações ----------
git status              # verifica o estado do repositório
git add .                # adiciona todos os arquivos modificados/novos
git commit -m "feat: adiciona tela de login"   # cria o commit
git log --oneline        # histórico resumido de commits

# ---------- 5. Sincronizando com o remoto ----------
git push -u origin feature/login   # envia a branch para o remoto
git pull origin main                # traz atualizações da branch main

# ---------- 6. Desfazendo alterações ----------
git restore arquivo.txt     # descarta alterações não commitadas
git reset --mixed HEAD~1    # desfaz o último commit, mantendo os arquivos
git revert <hash_do_commit> # desfaz um commit específico criando um novo commit
