/*Autores:Felipe Merino y Priscila Morales
Localizar y validar un camino que forme la palabra deseada.
Entrada:

Matriz:

C A T

A T A

T A C

Palabra: CAT


Salida esperada:

Encontrada en: (0,0) → (0,1) → (0,2) */
public class sopa_letras {
    public static void main(String[] args) {
        char[][] letras = {
            {'C', 'A', 'T'},
            {'A', 'T', 'A'},
            {'T', 'A', 'C'}
        };
        
        String palabra = "CAT";
        
        System.out.println("Matriz:");
        for (int i = 0; i < letras.length; i++) {
            for (int j = 0; j < letras[0].length; j++) {
                System.out.print(letras[i][j] + " ");
            }
            System.out.println();
        }
        
        Caminos(letras, palabra);
    }
    
    public static void Caminos(char[][] letras, String palabra) {
        // Recorrer cada posición de la matriz
        for (int i = 0; i < letras.length; i++) {
            for (int j = 0; j < letras[0].length; j++) {
                // Si coincide la primera letra, buscar desde aquí
                if (letras[i][j] == palabra.charAt(0)) {
                    buscar(letras, palabra, i, j, 0, "");
                }
            }
        }
    }
    
    // Recursión simple: busca letra por letra
    private static void buscar(char[][] letras, String palabra, int fila, int col, int pos, String camino) {
        // Verificar límites
        if (fila < 0 || fila >= letras.length || col < 0 || col >= letras[0].length) {
            return;
        }
        
        // Comparar char actual
        if (letras[fila][col] != palabra.charAt(pos)) {
            return;
        }
        
        // Agregar posición al camino
        camino += (pos == 0 ? "" : " → ") + "(" + fila + "," + col + ")";
        
        // Si terminamos la palabra
        if (pos == palabra.length() - 1) {
            System.out.println("Encontrada en: " + camino);
            return;
        }
        
        // Buscar en 4 direcciones: derecha, abajo, izquierda, arriba
        buscar(letras, palabra, fila, col + 1, pos + 1, camino); // derecha
        buscar(letras, palabra, fila + 1, col, pos + 1, camino); // abajo
        buscar(letras, palabra, fila, col - 1, pos + 1, camino); // izquierda
        buscar(letras, palabra, fila - 1, col, pos + 1, camino); // arriba
    }
}
