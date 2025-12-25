/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.mavenproject1;
import java.util.ArrayList;
import java.util.Scanner;
/**
 *
 * @author P3E002-B
 */
public class Mavenproject1 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Integer> numerosAleatorios = new ArrayList<>();
        int numerosLista = 20; 
        int minimo = 0; 
        int maximo = 10;
        for(int i = 0; i < numerosLista; i++){
            int numero = (int)(Math.random() * (maximo - minimo + 1) + minimo);
            numerosAleatorios.add(numero);
        }
        System.out.println("Lista:" + numerosAleatorios);
        
        System.out.println("Elija el numero a buscar: ");
        int numeroEncontrar = sc.nextInt();
        int vecesEncontrado = 0;
        int posicion = 0;
        for(int n: numerosAleatorios){
            posicion++;
            if(numeroEncontrar == n){
                vecesEncontrado = vecesEncontrado + 1;
                System.out.println("se ha encontrado un "+ numeroEncontrar + " En la posicion: " + posicion);
            }
            
        }
        
        System.out.println("Veces encontrado: " + vecesEncontrado);

        
        
    }
}
