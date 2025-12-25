/*
 Mediante pilas verificar si es palindromo
* */
import java.util.ArrayList;
import java.util.Stack;
public class ejercicio1 {
    public static void main(String[] args) {
        //le hice pensando que era hciendo un grupo de palabras, luego me di cuenta que era la frase
        String frase = "yo hago yoga hoy";

        ArrayList<String> palabras = new ArrayList<>();
        palabras.add(frase);


        confirmarPalindromo(palabras);
    }


    public static void confirmarPalindromo(ArrayList<String> palabras){
        boolean bandera = false;
        Stack<Character> palindromo = new Stack<>();
        for(String palabraOriginal : palabras){
            String palabra = palabraOriginal.toLowerCase().replaceAll(" ","");
            //Agrego a la pila las letras de la palabra
            for(int i = 0; i < palabra.length(); i++){
                palindromo.push(palabra.charAt(i));
                System.out.println("Agregada la letra: " + palindromo.peek());
            }

            for(int i = 0; i < palabra.length(); i++){
                char letraActual = palindromo.pop();
                if(palabra.charAt(i) == letraActual){
                    System.out.println(letraActual + " es igual a: " + palabra.charAt(i));
                    bandera = true;
                }else {
                    System.out.println(letraActual + " es diferente de: " + palabra.charAt(i));
                    bandera = false;
                    break;
                }
            }
            if(bandera == false){
                System.out.println("La palabra " + palabraOriginal + " no es palindromo");
            }else {
                System.out.println("La palabra " + palabraOriginal + " es palindromo");
            }
        }
    }
}
