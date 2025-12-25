
"""
1 Una empresa recibe un millón de correos electrónicos de usuarios registrados.

Tareas:

- Inserta cada correo en una tabla hash de tamaño 13 (probar con 20 correos).

- La función hash debe contar el número de vocales, multiplicar por la cantidad de consonantes y sumar la cantidad de caracteres especiales.

- Implementar chaining hash para la inserción

- Imprimir la tabla con los elementos insertados
"""

class TablaHash:
    def __init__(self, size):
        self.size = size
        #Crea los espacios d e la tabla 
        self.table = [[] for _ in range(size)]
    
    def aplicar_formula(self, email):
        vocales = "aeiouAEIOU"
        consonantes = "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
        caracteres_especiales = 0
        conteo_vocales = 0
        conteo_consonantes = 0
        # Contamos las vocales y consonantes cuando las encontramos 
        for char in email:
            if char in vocales:
                conteo_vocales += 1
            elif char in consonantes:
                conteo_consonantes += 1
            else:
                caracteres_especiales += 1
        # usamos el modulo de self.size (en este caso 13) para mantener al resultado dentro del rango requerido 
        return (conteo_vocales * conteo_vocales + conteo_consonantes) % self.size
    
    #self objeto de la funcion TablaHash, por eso puedo aplicarle las funciones que cree dentro de dicha formula 
    def insertar(self, email):
        index = self.aplicar_formula(email)
        self.table[index].append(email)
    
    #enumerate devuelve los elementos de la posicion i
    def mostrar(self):
        for i, bucket in enumerate(self.table):
            # Del espacio i, obtiene el elemento que esta en i 
            print(f"Bucket {i}: {bucket}")

# Lista de 20 correos generados aleatoriamente
emails = [
    "user1@gmail.com",
    "john.doe@yahoo.com",
    "test@hotmail.com",
    "alice123@outlook.com",
    "bob_smith@icloud.com",
    "charlie.brown@aol.com",
    "david_miller@protonmail.com",
    "eva.green@mail.com",
    "frank_white@inbox.com",
    "grace_lee@yandex.com",
    "henry_taylor@fastmail.com",
    "irene_wong@zoho.com",
    "jackson5@live.com",
    "kate.moss@gmx.com",
    "larry_page@hubspot.com",
    "megan_harris@rocketmail.com",
    "nathan_king@tutanota.com",
    "olivia_wild@disposable.com",
    "paul_rodriguez@cheap.com",
    "andres.merino01@epn.edu.ec"
]

# Crear tabla hash de tamaño 13
hash_table = TablaHash(13)

# Insertar cada correo en la tabla
for email in emails:
    hash_table.insertar(email)

# Mostrar la tabla hash resultante
hash_table.mostrar()