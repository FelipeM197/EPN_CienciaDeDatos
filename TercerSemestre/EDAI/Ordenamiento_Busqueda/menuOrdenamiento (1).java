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
            System.out.println("1. Bubble Sort");
            System.out.println("2. Insertion Sort");
            System.out.println("3. Salir");
            System.out.println("Elije una opcion: ");

            int opcion = sc.nextInt();

            if (opcion == 1){
                ArrayList<Integer> copiaBurbuja = new ArrayList<>(numerosAleatorios);
                System.out.println("Lista Actual: "+ copiaBurbuja + "\n");
                int contadorDePasos = 0;


                //Algoritmo Bubble sort 
                //Se plantean 2 bucles for, el primero determinará cuantas vueltas a la lista requiere el algoritmo
                for (int i = 0; i < copiaBurbuja.size() - 1; i++){

                    /* El segundo bucle se encargará de ordenar y recorrer los números de la lista
                    n-1-i porque si en una vuelta del primer bucle ya llevó un número
                    al tope de la lista, entonces ya no es necesario leer ese número denuevo
                    */
                    for(int j = 0; j < copiaBurbuja.size() - i - 1; j++){
                        int numeroSig = copiaBurbuja.get(j+1);
                        if(copiaBurbuja.get(j) > numeroSig){
                            contadorDePasos = contadorDePasos +1;
                            int numActual = copiaBurbuja.get(j);
                            /* Si se quiere mayor detalle
                            System.out.println("Se ha encontrado un caso de cambio: " + numActual + " > " + numeroSig+ "\n");
                            */
                            // Muevo el nuevo numero mayor adelante
                            copiaBurbuja.set(j, numeroSig);
                            /* Por como funciona set, el numero mayor esta en ambas posiciones
                            Entonces debo poner el numero menor en la posicion anterior
                            */
                            copiaBurbuja.set(j+1, numActual);
                            System.out.println("Paso: " + contadorDePasos + " " + copiaBurbuja + "\n");
                            
                        // Si se quiere mayor detalle    
                        }/*else{
                            System.out.println(copiaBurbuja.get(j) + " < " + numeroSig + " No hay cambio..." + "\n");
                        }*/
                    }
                }
                System.out.println("Lista ordenada: " + copiaBurbuja);

                    
                    
                    
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
                    System.out.println("Paso " + i + ": " + copia + "\n");
                }

                System.out.println("Numeros ordenados: " + copia + "\n");
            } else if (opcion == 3){
                break;
            }
        }

        sc.close();
    }
}