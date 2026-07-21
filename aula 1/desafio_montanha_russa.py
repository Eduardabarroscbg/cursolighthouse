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
