import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

/* Transformar un numero a binario haciendo uso de colas */

public class ejercicio3 {

    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Ingrese un numero: ");
        int numero = sc.nextInt();

        transformarBinario(numero);
    }

    public static void transformarBinario(int numero){
        int numeroOriginal = numero;
        StringBuilder binario = new StringBuilder();
        Queue<Integer> numeros = new LinkedList<>();


        obtenerBit(numero, numeros);

        while(!numeros.isEmpty()){
            binario.append(numeros.poll());
        }

        System.out.println("Binario de: " + numeroOriginal + " es: " + binario);
    }


    public static void obtenerBit(int numero, Queue<Integer> cola){
        if(numero == 0){
            return;
        }

        // recursividad aplicada
        obtenerBit(numero / 2, cola);

        int bit = numero % 2;
        System.out.println("Bit generado: " + bit);
        cola.offer(bit);
    }
}
