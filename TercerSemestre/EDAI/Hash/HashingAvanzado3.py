"""
3) Almacene los dígitos de su cédula en una tabla hash de tamaño 10

Tareas:

- Las claves se obtienen (funció hash) a partir de la fórmula que se usa para generar el dígito verificador 
(https://medium.com/@bryansuarez/c%C3%B3mo-validar-c%C3%A9dula-y-ruc-en-ecuador-b62c5666186f)

- Imprimir los datos que no se almacenan por estar duplicados.
"""
def calcular_digito_verificador(cedula):
    #Calculo del dígiyo vetificador 
    coeficientes = [2, 1, 2, 1, 2, 1, 2, 1, 2]
    suma = 0
    
    for i in range(9):
        digito = int(cedula[i])
        producto = digito * coeficientes[i]
        
        # Si el producto es >= 10, restar 9
        if producto >= 10:
            producto -= 9
            
        suma += producto
    
    # Calcular el dígito verificador
    residuo = suma % 10
    if residuo == 0:
        return 0
    else:
        return 10 - residuo

def hash_cedula(cedula, posicion_actual=None):
    if posicion_actual is not None:
        digito = int(cedula[posicion_actual])
        return (digito + posicion_actual) % 10
    else:
        return calcular_digito_verificador(cedula)

tabla_hash = [None] * 10
duplicados = []

mi_cedula = "1755035258"  

print("Cédula completa:", mi_cedula)

for posicion, digito_char in enumerate(mi_cedula):
    digito = int(digito_char)
    
    posicion_hash = hash_cedula(mi_cedula, posicion)
    
    if tabla_hash[posicion_hash] is None:
        tabla_hash[posicion_hash] = digito
        print(f"Dígito {digito} almacenado en posición {posicion_hash}")
    else:
        duplicados.append(digito)
        print(f"Dígito {digito} NO almacenado - posición {posicion_hash} ocupada")

print("--- TABLA HASH RESULTANTE ---")
for i in range(10):
    print(f"Posición {i}: {tabla_hash[i]}")

print("--- DÍGITOS NO ALMACENADOS (duplicados) ---")
if duplicados:
    for digito in duplicados:
        print(f"Dígito {digito}")
else:
    print("No hubo dígitos duplicados")

print(f"\nDígito verificador calculado: {calcular_digito_verificador(mi_cedula)}")
print(f"Dígito verificador real: {mi_cedula[9]}")