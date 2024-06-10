#!/bin/bash

# Função para exibir o menu de tipos de commit
show_menu() {
    echo "Selecione o tipo de commit:"
    echo "1. feat: Uma nova funcionalidade"
    echo "2. fix: Correção de um bug"
    echo "3. docs: Mudanças apenas na documentação"
    echo "4. style: Mudanças que não afetam o significado do código (espaços em branco, formatação, etc.)"
    echo "5. refactor: Mudança de código que não corrige um bug nem adiciona uma funcionalidade"
    echo "6. perf: Mudança de código que melhora o desempenho"
    echo "7. test: Adicionando testes ausentes ou corrigindo testes existentes"
    echo "8. build: Mudanças que afetam o sistema de build ou dependências externas"
    echo "9. ci: Mudanças nos arquivos e scripts de configuração de CI (exemplo: GitLab CI, CircleCI)"
    echo "10. chore: Outras mudanças que não modificam arquivos de código ou testes"
    echo "11. revert: Revertendo um commit"
}

# Solicita o tipo de commit
show_menu
read -p "Digite o número correspondente ao tipo de commit: " commit_type

# Define o prefixo do commit com base na seleção do usuário
case $commit_type in
    1) prefix="feat" ;;
    2) prefix="fix" ;;
    3) prefix="docs" ;;
    4) prefix="style" ;;
    5) prefix="refactor" ;;
    6) prefix="perf" ;;
    7) prefix="test" ;;
    8) prefix="build" ;;
    9) prefix="ci" ;;
    10) prefix="chore" ;;
    11) prefix="revert" ;;
    *) echo "Tipo de commit inválido."; exit 1 ;;
esac

# Solicita o escopo (opcional)
read -p "Digite o escopo (opcional): " scope

# Formata o escopo se fornecido
if [ ! -z "$scope" ]; then
    scope="($scope)"
fi

# Solicita a descrição
read -p "Digite a descrição do commit: " description

# Verifica se a descrição foi fornecida
if [ -z "$description" ]; then
    echo "Descrição do commit é obrigatória."
    exit 1
fi

# Solicita o corpo da mensagem (opcional)
read -p "Digite o corpo da mensagem do commit (opcional): " body

# Concatena a mensagem de commit
commit_message="$prefix$scope: $description"
if [ ! -z "$body" ]; then
    commit_message="$commit_message\n\n$body"
fi

# Executa git add e git commit
git add .
git commit -m "$commit_message"

echo "Commit formatado com sucesso de acordo com as convensões: $commit_message"
echo "Execulte push para o repositorio remoto"
