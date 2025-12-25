
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

/*
representar el flujo vehicular con un semaforo y 2 carriles 
tengo un semaforo, es una interseccion, ingresan la misma cantidad 
de datos de un sentido como de otro sentidi

el semaforo deja pasar una cantidad de carros especificos y luego cambia de sentido
*/
public class ejercicio2 {
    public static void main(String[] args) {
        Queue semaforo = new LinkedList<>(); // el semaforo deja pasar 3 carros por ciclo

        ArrayList<String> carril1 = new ArrayList<>();
        ArrayList<String> carril2 = new ArrayList<>();
        // ingreso 4 carros y dejare pasar 3 carros por ciclo
        carril1.add("Carro A1");
        carril1.add("Carro A2");
        carril1.add("Carro A3");
        carril1.add("Carro A4");


        carril2.add("Carro B1");
        carril2.add("Carro B2");
        carril2.add("Carro B3");
        carril2.add("Carro B4");
        //mientras los carriles no esten vacios 
        while(!carril1.isEmpty() || !carril2.isEmpty()){
            System.out.println("Ciclo carril 1:");
            dejarPasarCarros(semaforo, carril1);
            System.out.println("Ciclo carril 2:");
            dejarPasarCarros(semaforo, carril2);
        }
    }

    public static void dejarPasarCarros(Queue semaforo, ArrayList<String> carril){
        int contador = 0;
        while(contador < 3 && !carril.isEmpty()){
            String carro = carril.remove(0);
            semaforo.add(carro);
            System.out.println("El " + carro + " paso por la interseccion");
            contador++;
        }
    }

    
}
