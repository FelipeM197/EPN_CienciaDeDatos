"""
2) Análisis de un conjunto de noticias para identificar las palabras más frecuentes. 

Tareas:

- Copia un texto de 5 líneas al menos y almacena cada palabra en una tabla hash de 25.

- La función hash debe estar basada en el código ASCII 

- Aplica sondeo cuadrático para almancenar la tabla

- Muestra las 10 palabras más frecuentes.

Observación: ignora stopwords y distingue mayúsculas/minúsculas.
"""

import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import string


class TablaHash:
    nltk.download('punkt')
    nltk.download('stopwords')
    def __init__(self, tamaño=25):
        self.tamaño = tamaño
        #Se encarga de crear una lista rellena de elementos "none" de 25 
        self.tabla = [None] * tamaño
        self.colisiones = 0
    
    def funcion_hash(self, palabra):
        """Suma ASCII"""
        # Con ord() se devuelve el codigo aSCII de cada caracter 
        suma_ascii = sum(ord(caracter) for caracter in palabra)
        #Nos aseguramos que el valor no este fuera del tamaño 
        return suma_ascii % self.tamaño
    
    def insertar(self, palabra):
        posicion = self.funcion_hash(palabra)
        
        # Sondeo cuadrático
        i = 0
        posicion_original = posicion
        
        while i < self.tamaño:
            nueva_posicion = (posicion_original + i**2) % self.tamaño
            

            # Avanzo posiciones, pero dentro de la lista hay componentes que son una lista de longitud 2 
            if self.tabla[nueva_posicion] is None:
                # Casilla vacía, insertar nueva palabra
                self.tabla[nueva_posicion] = [palabra, 1]
                return True
            elif self.tabla[nueva_posicion][0] == palabra:
                # Palabra ya existe, incrementar frecuencia
                self.tabla[nueva_posicion][1] += 1
                return True
            else:
                # Colisión
                i += 1
                self.colisiones += 1
        
        # Tabla llena
        return False
    
    def obtener_frecuencias(self):
        frecuencias = []
        for elemento in self.tabla:
            if elemento is not None:
                #Ingreso el elemento junto con su frecuencia respectiva 
                frecuencias.append((elemento[0], elemento[1]))
        return frecuencias

def procesar_texto(texto):
    # Tokenizar el texto
    tokens = word_tokenize(texto)
    
    # Obtener stopwords en español
    stop_words = set(stopwords.words('spanish'))
    
    # Limpiar palabras: eliminar puntuación y filtrar stopwords
    palabras_limpias = []
    for token in tokens:
        # Convertir a minúsculas y eliminar puntuación
        palabra = token.lower()
        palabra = palabra.strip(string.punctuation + "¡!¿?\"'")
        
        # Filtrar: debe ser alfabético, no ser stopword, y tener longitud > 1
        if (palabra.isalpha() and 
            palabra not in stop_words and 
            len(palabra) > 1):
            palabras_limpias.append(palabra)
    
    return palabras_limpias

def analizar_noticias():
    # Texto de ejemplo (noticias)
    texto_noticias = """
    El gobierno anunció nuevas medidas económicas para reactivar el mercado. 
    La bolsa de valores subió considerablemente durante la jornada de hoy.
    Los inversionistas mostraron optimismo ante las nuevas políticas fiscales.
    El ministro de economía destacó el crecimiento del producto interno bruto.
    Analistas predicen una tendencia positiva para los próximos trimestres.
    Las empresas tecnológicas lideraron las ganancias en el mercado accionario.
    """
    
    print("Texto analizado:")
    print(texto_noticias)
    
    # Procesar texto
    palabras = procesar_texto(texto_noticias)
    
    print(f"Palabras válidas encontradas: {len(palabras)}")
    print(f"Palabras: {palabras}")
    
    # Crear tabla hash
    tabla = TablaHash(25)
    
    # Insertar palabras en la tabla hash
    for palabra in palabras:
        tabla.insertar(palabra)
    
    # Mostrar estado de la tabla hash
    print("=== TABLA HASH ===")
    for i, elemento in enumerate(tabla.tabla):
        if elemento is not None:
            print(f"Posición {i:2d}: '{elemento[0]}': {elemento[1]} ocurrencias")
        else:
            print(f"Posición {i:2d}: Vacía")
    
    print(f"Total de colisiones: {tabla.colisiones}")
    
    # Obtener y mostrar las 10 palabras más frecuentes
    frecuencias = tabla.obtener_frecuencias()
    frecuencias_ordenadas = sorted(frecuencias, key=lambda x: x[1], reverse=True)
    
    print("10 palabras mas frecuentes: ")
    for i, (palabra, frecuencia) in enumerate(frecuencias_ordenadas[:10], 1):
        print(f"{i:2d}. '{palabra}': {frecuencia} ocurrencias")

# Ejecutar el análisis
if __name__ == "__main__":
    analizar_noticias()