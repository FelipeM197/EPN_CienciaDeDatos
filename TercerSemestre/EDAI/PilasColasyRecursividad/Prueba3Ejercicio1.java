//fila 1 
/*
Comprobar si una frase, que puede incluir espacios es palindromo utilizando pilas 
*/

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Stack;

public class ejercicio1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String ejemplo = "radar";
        // System.out.println("Introduce una frase:");
        //String frase = scanner.nextLine();
        //frase = frase.replaceAll(" ", "").toLowerCase();

        // elimino espacios y paso todo a minusculas 
        ejemplo = ejemplo.replaceAll(" ", "").toLowerCase();

        //System.out.println("La frase ingresada es: " + frase);
        boolean resultado = esPalindromo(ejemplo);
        if(resultado){
            System.out.println("La frase es palindromo");
        }else{
            System.out.println("La frase no es palindromo");
        }
        
    }
    public static boolean esPalindromo(String frase){
        boolean bandera = false;
        char[] letras = frase.toCharArray();


        ArrayList<Character> listaLetras = new ArrayList<>();

        Stack<Character> pila = new Stack<>();

        for(char a : letras){
            pila.push(a); 
        }

        for(char a : letras){
            listaLetras.add(pila.pop());
        }
        String fraseInvertida = "";
        for(char a : listaLetras){
            fraseInvertida += a;
        }

        if(frase.equals(fraseInvertida)){
            bandera = true;
        }
        return bandera;

    }
}