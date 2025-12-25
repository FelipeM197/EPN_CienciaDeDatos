import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class menuOrdenamiento {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random random = new Random();

        //20 numeros aleatorios
        ArrayList<Integer> numerosAleatorios = new ArrayList<>();
        for (int i = 0; i < 20; i++){
            numerosAleatorios.add(random.nextInt(100) + 1);
        }

        //imprimirlos
        System.out.println(numerosAleatorios);

        while(true){
            System.out.println("1. Bubble Sort(felipe)");
            System.out.println("2. Insertion Sort");
            System.out.println("3. Salir");
            System.out.println("Elije una opcion: ");

            int opcion = sc.nextInt();

            if (opcion == 1){
                //codigo de felipe
            } else if (opcion == 2){
                //algoritmo insertion
                ArrayList<Integer> copia = new ArrayList<>(numerosAleatorios);

                for(int i = 1; i < copia.size(); i++){ //empieza desde el segundo elemento (asumiendo que el primero ya está ordenado)
                    int clave = copia.get(i); //elemento a comparar
                    int j = i - 1; //elemento anterior

                    while(j >= 0 && copia.get(j) > clave){ //mientras no se salga del arreglo y sea mayor a la clave
                        copia.set(j + 1, copia.get(j));
                        j--;
                    }
                    copia.set(j + 1, clave); //insertar la clave en la posicion correcta

                    //imprimir los pasos
                    System.out.println("Paso " + i + ": " + copia);
                }

                System.out.println("Numeros ordenados: " + copia);
            } else if (opcion == 3){
                break;
            }
        }

        sc.close();
    }
}