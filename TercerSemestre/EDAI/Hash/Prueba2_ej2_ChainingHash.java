
import java.util.ArrayList;
import java.util.LinkedList;


/*
4) Almacena el listado de materias en una tabla hash de tamaño 7

[“estructuras de datos”, “inteligencia artificial”, “métodos numéricos”]

La función hash es = [(# letras de la primera palabra) * (#letras de la segunda palabra)] + (#letras de la tercera palabra) + (#letras de la cuarta palabra) + …

Usa 10 ejemplos y para resolver colisiones usa Chaining sort.
 */
public class ej2_ChainingHash {
    public static void main(String[] args) {
        ArrayList<String> materias = new ArrayList<>();
        materias.add("estructuras de datos");
        materias.add("inteligencia artificial");
        materias.add("métodos numéricos");
        materias.add("Algoritmos y programación");
        materias.add("Sistemas operativos");
        materias.add("Redes de computadoras");
        materias.add("aosijdioasjdi");
        materias.add("Ingeniería de software");
        materias.add("Computación gráfica");
        materias.add("Programacion orientada a objetos");
        int tamanoTablaHash = 7;

        // Se crea la tabla hash
        ArrayList<LinkedList<String>> tablaHash = new ArrayList<>(tamanoTablaHash);
        for (int i = 0; i < tamanoTablaHash; i++) {
            tablaHash.add(new LinkedList<>());
        }

        System.out.println(tablaHash);

        // Recorremos el array de materias e insertamos cada uno en la tabla

        for (String materia : materias) {
            insertarEnTablaHash(tablaHash, materia);
        }
        for(int i=0; i<tablaHash.size(); i++){
            System.out.println(i + ": " + tablaHash.get(i));
        }


    }

    public static int funcionHash(String materia, int tamanoTabla) {
        String[] palabras = materia.split(" ");
        int hash = 1;

        for (String palabra : palabras) {
            //Por cada palabra se multiplica, como lo dicta el ejercicio 
            hash *= palabra.length();
        }
        //Devolvemos el resultado calculado, siempre contolando que no rebase el 7
        return hash % tamanoTabla;

    }

    public static void insertarEnTablaHash(ArrayList<LinkedList<String>> tablaHash, String materia) {
        
        int indice = funcionHash(materia, tablaHash.size());
        //Incluimos la materia en la lista, segun su indice obtenido por formula 
        tablaHash.get(indice).add(materia);
    }

}
