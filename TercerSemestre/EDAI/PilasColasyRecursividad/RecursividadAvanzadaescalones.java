
import java.util.Scanner;

/*Autores:Felipe Merino y Priscila Morales
Caso: Simulador Médico de Marcha (Escaleras)

Contexto:
Una aplicación médica simula cuántas formas puede subir un paciente 1 o 2 escalones según su condición física.
Problema:
Modelar cuántas posibles combinaciones existen para subir una escalera de n peldaños.
Entrada:
n = 5 escalones
Salida esperada:
Total de formas: 8
Interpretación visual de una forma (ejemplo):
1 + 1 + 2 + 1 
*/

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class escalones {

    public static void main(String[] args) {
        int escalones = 0;
        Scanner sc = new Scanner(System.in);
        
       
        
        do {
            System.out.print("Ingrese el número de escalones: ");
            escalones = sc.nextInt();
            
            if (escalones <= 0) {
                System.out.println("Ingrese un número válido de escalones (mayor a 0)");
                System.out.println();
            }
            
        } while (escalones <= 0);
        
        int formas = calcularFormas(escalones);
        
       
        System.out.println("Escalones a subir: " + escalones);
        System.out.println("Total de formas posibles: " + formas);
  
        
    }
    
    // Método recursivo para calcular las formas de subir escalones
    public static int calcularFormas(int escalones) {
        // Casos base
        if (escalones <= 0) {
            return 0;
        }
        if (escalones == 1) {
            return 1;
        }
        if (escalones == 2) {
            return 2;
        }
        
        
        return calcularFormas(escalones - 1) + calcularFormas(escalones - 2)  ;

    }
}

