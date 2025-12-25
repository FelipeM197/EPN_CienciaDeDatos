/*
Caso: Ruta para Robot Explorador (Laberinto)

Contexto:

Un robot debe encontrar un camino seguro en una bodega con zonas bloqueadas y zonas libres.

Problema:

Identificar un camino desde la entrada hasta la salida evitando obstáculos.

Entrada (matriz 1 = libre, 0 = bloqueada):

Inicio (0,0) → Salida (2,2)

[1, 0, 1]

[1, 1, 1]

[0, 1, 1]



Salida esperada:

Ruta encontrada:

(0,0) → (1,0) → (1,1) → (1,2) → (2,2)


Grupo: Felipe Merino, Priscila Morales
 */


import java.util.ArrayList;
import java.util.List;

public class ej1 {

    public static void main(String[] args) {
        int[][] matriz = {
                {1, 0, 1},
                {1, 1, 1},
                {0, 1, 1}
        };

        // Encontrar la ruta
        ArrayList<int[]> ruta = encontrarRuta(matriz);

        if (!ruta.isEmpty()) {
            System.out.println("Ruta final:");
            for (int i = 0; i < ruta.size(); i++) {
                int[] punto = ruta.get(i);
                System.out.print("(" + punto[0] + "," + punto[1] + ")");

                if (i < ruta.size() - 1) {
                    System.out.print(" → ");
                }
            }
            System.out.println();
        } else {
            System.out.println("No se encontró una ruta.");
        }
    }

    public static ArrayList<int[]> encontrarRuta(int[][] laberinto) {
        ArrayList<int[]> ruta = new ArrayList<>();
        boolean[][] visitado = new boolean[laberinto.length][laberinto[0].length];
        int[] inicio = {0, 0};
        int[] salida = {2, 2};

        // llamo a la funcion que utiliza recursividad
        if (buscadorRuta(laberinto, inicio[0], inicio[1], salida, visitado, ruta)) {
            return ruta;
        }

        return new ArrayList<>(); // Retorna lista vacía si no encuentra ruta
    }

    private static boolean buscadorRuta(int[][] laberinto, int fila, int columna, int[] salida, boolean[][] visitado, ArrayList<int[]> ruta) {
        // Verificar si llegamos a la salida
        if (fila == salida[0] && columna == salida[1]) {
            ruta.add(new int[]{fila, columna});
            return true;
        }

        // Verificar si la celda actual es válida
        if (!esCeldaValida(laberinto, fila, columna) || visitado[fila][columna]) {
            return false;
        }

        // Marcar como visitada y agregar a la ruta
        visitado[fila][columna] = true;
        ruta.add(new int[]{fila, columna});

        // Definir direcciones: derecha, abajo, izquierda, arriba
        int[][] direcciones = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

        // Probar todas las direcciones posibles
        for (int[] direccion : direcciones) {
            int nuevaFila = fila + direccion[0];
            int nuevaColumna = columna + direccion[1];

            if (buscadorRuta(laberinto, nuevaFila, nuevaColumna, salida, visitado, ruta)) {
                return true;
            }
        }

        // Backtrack: remover la celda actual si no lleva a la solución
        if (!ruta.isEmpty()) {
            ruta.remove(ruta.size() - 1);
        }
        return false;
    }

    private static boolean esCeldaValida(int[][] laberinto, int fila, int columna) {
        return fila >= 0 && fila < laberinto.length && columna >= 0 && columna < laberinto[0].length &&
                laberinto[fila][columna] == 1;
    }
}