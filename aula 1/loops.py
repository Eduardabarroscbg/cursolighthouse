num = int(input("Digite um número para ver a tabuada: "))
print(f"Tabuada do {num}:")

# usando for
for i in range(1, 11):
    resultado = num * i
    print(f"{num} x {i} = {resultado}")

# usando while
print("\nUsando while:")
i = 1
while i != 11:
    resultado = num * i
    print(f"{num} x {i} = {resultado}")
    i = i + 1
