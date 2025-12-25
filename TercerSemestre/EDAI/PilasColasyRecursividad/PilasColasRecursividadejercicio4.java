import java.util.Scanner;

/*usando recursividad ingresar 3 digitos por ejemplo (abc), e imprimir todas las combinaciones posibles
como: cab, bac, etc*/
public class ejercicio4 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Ingrese los digitos");
        String texto = sc.nextLine();

        System.out.println("Combinaciones");
        permutar("", texto);
    }

    public static void permutar(String prefijo, String resto) {
        if (resto.length() == 0) {
            System.out.println(prefijo);
            return;
        }

        // Elegimos cada letra del resto analizamos cada palabra del resto y las vamos unidendo en el string
        for (int i = 0; i < resto.length(); i++) {
            char letra = resto.charAt(i);
            String nuevoPrefijo = prefijo + letra;
            String nuevoResto = resto.substring(0, i) + resto.substring(i + 1);

            permutar(nuevoPrefijo, nuevoResto);
        }
    }
}
