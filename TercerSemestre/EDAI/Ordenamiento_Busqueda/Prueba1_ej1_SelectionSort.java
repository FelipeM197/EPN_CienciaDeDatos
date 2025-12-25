
import java.util.ArrayList;

//grupo 4: selection
// grupo 4: chaining

/*
4) Un editor de texto necesita ordenar palabras según su tamaño.

Utilizar 10 datos como ejemplo, y realizar el ordenamiento Selection Sort e imprime cada iteración.

Entrada

["Hola", "Programación", "IA", "ChatGPT"]

Salida

["IA", "Hola", "ChatGPT", "Programación"]


 */
public class ej1_SelectionSort {

    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("Hola");
        palabras.add("Programacion");
        palabras.add("IA");
        palabras.add("asudaoisjdaoisjdoa");
        palabras.add("VScode");
        palabras.add("Java");
        palabras.add("Python");
        palabras.add("Ingenieria");
        palabras.add("Datos");
        palabras.add("Algoritmos");
        
        System.out.println("Lista original: " + palabras);
        selectionSort(palabras);

        System.out.println("Lista final ordenada: " + palabras);

    }

    public static void selectionSort(ArrayList<String> lista) {
        int n = lista.size();

        for (int i = 0; i < n - 1; i++) {
            // El primer elemento se marca como indice minimo
            int indiceMinimo = i;
            // Se busca el indice minimo en el resto del array
            for (int j = i + 1; j < n; j++) {
                // Se obtiene el tamaño de la palabra y se lo usa para comparar
                // Si j es menor que el indice minimo, entonces lo cambiamos y usamos eso para cambiar la posicion
                if (lista.get(j).length() < lista.get(indiceMinimo).length()) {
                    indiceMinimo = j;
                }

            }        
            // Se intercambia el elemento minimo con el nuevo elemento menor
            String temp = lista.get(indiceMinimo);
            lista.set(indiceMinimo, lista.get(i));
            lista.set(i, temp);
            // Linea para imprimir la lista de cambios
            System.out.println("Iteracion " + (i + 1) + ": " +lista);

        }
    }
    
}
