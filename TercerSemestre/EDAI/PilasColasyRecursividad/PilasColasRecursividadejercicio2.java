import java.util.Scanner;
import java.util.Stack;

/*
 pido al usuario a un numero, lo desgloso desde el 1 hasta el numero, primero se apila 5,
  hasta el 1, los desapilo y los multiplico, al final debe salir igual al factorial del numero ingresado
* */
public class ejercicio2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Ingrese un numero: ");
        int numero = sc.nextInt();

        apilarNumeros(numero);
    }

    public static void apilarNumeros(int numero){
        Stack<Integer> numeros = new Stack<>();
        for(int i = 1; i <= numero; i++){
            numeros.push(i);
            System.out.println("Se ingreso el numero: " + i);
        }

        int resultadoFactorial = multiplicarNumeros(numeros);
        System.out.println(numero+"!"+ " = " + resultadoFactorial);
    }


    public static int multiplicarNumeros(Stack<Integer> numeros){

        if(numeros.isEmpty()){
            return 1;
        }

        int numero1 = numeros.pop();
        //llamada recursiva, el primer resultado sera 1
        int resultadoParcial = multiplicarNumeros(numeros);
        return resultadoParcial*numero1;
    }
}
