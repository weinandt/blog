valueLength = 1000
numberOfKeys = 2000000

value = "x" * valueLength
for x in range(numberOfKeys):
    print("SET", str(x), value, sep=" ", end="\n")