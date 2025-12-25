

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Scanner;

public class Main {


    public static void main(String[] args) {
        System.out.println("Porfavor ingrese la cantidad de numeros a generar");
        Scanner sc = new Scanner(System.in);
        ArrayList<Integer> numerosAleatorios = new ArrayList<>();
        int generarNumeros = sc.nextInt();
        int minimo = 0; 
        int maximo = 10;
        for(int i = 0; i < generarNumeros; i++){
            int numero = (int)(Math.random() * (maximo - minimo + 1) + minimo);
            numerosAleatorios.add(numero);
        }
        System.out.println("Lista:" + numerosAleatorios);
        System.out.println("Ordeando...");
        Collections.sort(numerosAleatorios);
        System.out.println("Lista:" + numerosAleatorios);
        
        int valorMedio = (generarNumeros + 1)/2;
        System.out.println("La posicion media es: " + valorMedio);
        System.out.println("Ingrese el número a buscar");
        int buscarNumero = sc.nextInt();

        
        for (int i = 0; i < numerosAleatorios.size(); i++) {
            int posicion = i;
            int valor = numerosAleatorios.get(i);
            // Para comprobar las posiciones:
            // System.out.println("Posición " + posicion + ": " + valor);
            if(posicion == valorMedio){
                int valorEncontrado = numerosAleatorios.get(i);
                System.out.println("El numero en la posicion media es: " + valorEncontrado);
                
                if(buscarNumero > valorEncontrado ){
                    System.out.println("Me muevo hacia la derecha");

                }else{
                    System.out.println("Me muevo hacia la izquierda");

                }
            }
            
        }
    }
}
