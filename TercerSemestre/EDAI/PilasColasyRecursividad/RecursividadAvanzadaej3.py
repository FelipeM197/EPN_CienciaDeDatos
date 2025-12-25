'''
Caso: Verificación de Sudokus en Videojuegos Educativos

Contexto:

Una empresa de videojuegos necesita comprobar si un Sudoku generado tiene solución válida.

Problema:

Desarrollar un algoritmo que complete el tablero respetando reglas lógicas.

Entrada (0 = vacío):

[ [5,3,0,0,7,0,0,0,0],

  [6,0,0,1,9,5,0,0,0],

  ...

]



Salida esperada (tablero solucionado):

[ [5,3,4,6,7,8,9,1,2],

  [6,7,2,1,9,5,3,4,8],

  ...

]


Nombre: Priscila Morales, Felipe Merino

'''
def es_valido(tablero, fila, col, num):
    for x in range(9):
        if tablero[fila][x] == num:
            return False
    for x in range(9):
        if tablero[x][col] == num:
            return False
    # esta formula calcula el inicio del subcuadro 3x3    
    start_fila = fila - fila % 3
    start_col = col - col % 3
    for i in range(3):
        for j in range(3):
            # aqui verifica si el numero ya esta en el subcuadro
            if tablero[i + start_fila][j + start_col] == num:
                return False
    return True
def resolver_sudoku(tablero):
    # Buscar una celda vacía
    for fila in range(9):
        for col in range(9):
            if tablero[fila][col] == 0:
                for num in range(1, 10):
                    if es_valido(tablero, fila, col, num):
                        # se iguala el numero en la celda
                        tablero[fila][col] = num
                        #recursivamente intenta resolver el resto del tablero
                        if resolver_sudoku(tablero):
                            return True
                        tablero[fila][col] = 0
                return False
    return True
#tenemos que crear un tablero 9x9 porque nos dieron 9 numeros 
sudoku = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
]
if resolver_sudoku(sudoku):
    for fila in sudoku:
        print(fila)
else:
    print("No se encontró solución")