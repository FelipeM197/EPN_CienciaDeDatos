'''
Caso: Cálculo de Rutas Óptimas para Drones (Camino con Costo)

Contexto:

Un dron debe minimizar el gasto de energía en su trayectoria, donde cada zona del terreno tiene un costo de vuelo distinto.

Problema:

Calcular el camino de menor costo desde la esquina superior izquierda a la inferior derecha.

Entrada:

[ [1,3,5],

  [2,1,2],

  [4,3,1] ]



Salida esperada:

Costo mínimo = 7

Ruta: (0,0) → (1,0) → (1,1) → (2,1) → (2,2)

Nombre: Priscila Morales, Felipe Merino
'''
def encontrar_camino_minimo(mapa):
    filas = len(mapa)
    columnas = len(mapa[0])
    
    #para guardar los resultados 
    calculados = {}
    # guardar de donde proviene 
    procedencia = [[None for _ in range(columnas)] for _ in range(filas)]
    
    def calcular_costo(fila, columna):
        # Si ya calculé este punto, devuelvo el resultado guardado
        if (fila, columna) in calculados:
            return calculados[(fila, columna)]
        
        # Si estoy en el inicio, el costo es el valor de esa casilla
        if fila == 0 and columna == 0:
            return mapa[0][0]
        
        # Si me salgo del mapa, devuelvo un número muy grande, para no considerar ese camino
        if fila < 0 or columna < 0:
            return float('inf')
        
        # Calculo costos desde arriba y desde la izquierda
        costo_arriba = calcular_costo(fila-1, columna)
        costo_izquierda = calcular_costo(fila, columna-1)
        
        # Elijo el camino más barato y guardo de dónde vengo
        if costo_arriba < costo_izquierda:
            procedencia[fila][columna] = (fila-1, columna)
            costo_actual = mapa[fila][columna] + costo_arriba
        else:
            procedencia[fila][columna] = (fila, columna-1)
            costo_actual = mapa[fila][columna] + costo_izquierda
        
        # Guardo el resultado para no volver a calcularlo
        calculados[(fila, columna)] = costo_actual
        return costo_actual
    
    # Calculo el costo mínimo hasta la esquina inferior derecha
    costo_total = calcular_costo(filas-1, columnas-1)
    
    camino = []
    fila_actual, columna_actual = filas-1, columnas-1
    
    # Voy desde el final hasta el inicio
    while fila_actual is not None and columna_actual is not None:
        camino.append((fila_actual, columna_actual))
        siguiente = procedencia[fila_actual][columna_actual]
        if siguiente:
            fila_actual, columna_actual = siguiente
        else:
            break
    
    camino.reverse()
    return costo_total, camino


# Prueba con el mapa dado
terreno = [
    [1, 3, 5],
    [2, 1, 2],
    [4, 3, 1]
]
costo, ruta = encontrar_camino_minimo(terreno)
print("Costo mínimo =", costo)
print("Ruta:", " → ".join(f"({fila},{columna})" for fila, columna in ruta))

