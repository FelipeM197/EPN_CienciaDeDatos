'''

Caso: Estrategia de Defensa en Tableros (N Reinas)

Contexto:

Un motor de estrategia militar simula posiciones de defensa donde una tropa no puede atacar a otra.

Problema:

Ubicar N tropas en un tablero N×N sin conflicto.

Entrada:

N = 4

Salida esperada:

. Q . .

. . . Q

Q . . .

. . Q .

(Solo 1 de varias soluciones posibles)

Nombre: Priscila Morales, Felipe Merino
'''


def es_seguro(tablero, fila, col, N):
    # Verificar la columna
    for i in range(fila):
        if tablero[i][col] == 1:
            return False
    # Verificar la diagonal izquierda
    for i, j in zip(range(fila, -1, -1), range(col, -1, -1)):
        if tablero[i][j] == 1:
            return False
    # Verificar la diagonal derecha
    for i, j in zip(range(fila, -1, -1), range(col, N)):
        if tablero[i][j] == 1:
            return False
    return True

def resolver_n_reinas_util(tablero, fila, N):
    if fila >= N:
        return True
    for col in range(N):
        if es_seguro(tablero, fila, col, N):
            tablero[fila][col] = 1
            if resolver_n_reinas_util(tablero, fila + 1, N):
                return True
            tablero[fila][col] = 0  # Backtrack
    return False

def resolver_n_reinas(N):
    tablero = [[0 for _ in range(N)] for _ in range(N)]
    if not resolver_n_reinas_util(tablero, 0, N):
        return None
    return tablero

# Ejemplo de uso
N = 4
solucion = resolver_n_reinas(N)
if solucion:
    for fila in solucion:
        print(' '.join('Q' if x == 1 else '.' for x in fila))
