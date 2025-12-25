/*Autores:Felipe Merino y Priscila Morales
Caso: Motor de Búsqueda con Palabras Clave (Subconjuntos)
Contexto:
Un buscador necesita generar combinaciones de palabras clave para analizar consultas más precisas.
Problema:
Generar el conjunto potencia (todas las combinaciones posibles).
Entrada:
Palabras: [A, B, C]
Salida esperada:
[]
[A]
[B]
[C]
[A, B]
[A, C]
[B, C]
[A, B, C] */
public class palabras_clave{
  
    public static void main(String[] args) {
        char[] palabras = {'A', 'B', 'C'};
        
        
        generarCombinaciones(palabras, 0, "");
    }
    
   
    public static void generarCombinaciones(char[] palabras, int posicion, String combinacion) {
        
     
        if (posicion == palabras.length) {
            
            if (combinacion.isEmpty()) {
                System.out.println("[]");
            } else {
                System.out.println("[" + combinacion + "]");
            }
            return;
        }
        
       
        generarCombinaciones(palabras, posicion + 1, combinacion);
        
        
        String nuevaCombinacion;
        if (combinacion.isEmpty()) {
        nuevaCombinacion = "" + palabras[posicion];
        } else {
            nuevaCombinacion = combinacion + ", " + palabras[posicion];
        }

        generarCombinaciones(palabras, posicion + 1, nuevaCombinacion);
    }
}