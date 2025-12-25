
import java.util.ArrayList;

/*
ingreso cualquier tipo de datos y utilizar recursividad para encontrar el dato seleccionado 
*/
public class ejercicio3 {
    public static void main(String[] args) {

        int dato1 = 5;
        String dato2 = "Hola";
        boolean dato3 = true;
        char dato4 = 'A';
        String dato5 = "Mundo";
        String dato6 = "true";
        ArrayList<String> datos = new ArrayList<>();
    
        //datos.add((String) dato1);
        datos.add(dato2);
        //datos.add(String.valueOf(dato3));
        //datos.add(String.valueOf(dato4));
        datos.add(dato5);

        datos.add(dato6);
        //asi se puede ir transformndo cualquier dato y ser capaz de buscarlo 
        String datoBuscado = "Mundos";
        boolean encontrado = buscarDato(datos, datoBuscado, 0);
        if(encontrado){
            System.out.println("Dato encontrado: " + datoBuscado);
        }else{
            System.out.println("Dato no encontrado ");
        }
    }

    public static boolean buscarDato(ArrayList<String> datos, String datoBuscado, int indice){
        // si el indice se sobrepasa 
        if(indice >= datos.size()){
            return false; //no se encontro el dato
        }
        if(datos.get(indice).equals(datoBuscado)){
            return true; 
        }
        return buscarDato(datos, datoBuscado, indice + 1);
    }
    
}
