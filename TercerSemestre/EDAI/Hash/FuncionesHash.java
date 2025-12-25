/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.edai;

import java.util.Scanner;

/**
 *
 * @author usuario
 */
public class EDAI {

    // 1. Contar el número de letras
    public static int contarLetras(String palabra) {
        int count = 0;
        try {
            while (true) {
                palabra.charAt(count);
                count++;
            }
        } catch (StringIndexOutOfBoundsException e) {
            // se usa el catch para marcar el fin de la palabra
            return count;
        }
    }
    
    // 2. Hashing usando posiciones en el abecedario (A=1, B=2, ..., Z=26)
    public static int hashPosicional(String palabra) {
        int resultado = 0;
        String palabraMayus = palabra.toUpperCase();
        int i = 0;
        
        try {
            while (true) {
                char letra = palabraMayus.charAt(i);
                if (Character.isLetter(letra)) {
                    //Para facilitar el programa tomamos a ñ como n 
                    
                    if (letra == 'Ñ') {
                        resultado += 14;
                    } else {
                        int posicion = letra - 'A' + 1;
                        resultado += posicion;
                    }
                }
                i++;
            }
        } catch (StringIndexOutOfBoundsException e) {
            // Fin de la cadena
        }
        
        return resultado;
    }
    
    // 3. Hashing mixto (valor * posición)
    public static int hashingMixto(String palabra) {
        int resultado = 0;
        String palabraMayus = palabra.toUpperCase();
        int i = 0;
        
        try {
            while (true) {
                char letra = palabraMayus.charAt(i);
                if (Character.isLetter(letra)) {
                    int valorLetra;
                    if (letra == 'Ñ') {
                        valorLetra = 14;
                    } else {
                        valorLetra = letra - 'A' + 1;
                    }
                    resultado += valorLetra * (i + 1);
                }
                i++;
            }
        } catch (StringIndexOutOfBoundsException e) {
        }
        
        return resultado;
    }
    
    // menu
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("=== SISTEMA DE HASHING DE PALABRAS ===");
        System.out.print("Ingrese una palabra: ");
        String palabra = scanner.nextLine();
        
        System.out.println("\nResultados para: '" + palabra + "'");
        System.out.println("1. Contar letras: " + contarLetras(palabra));
        System.out.println("2. Hashing posicional: " + hashPosicional(palabra));
        System.out.println("3. Hashing mixto: " + hashingMixto(palabra));
        
        scanner.close();
    }
}
