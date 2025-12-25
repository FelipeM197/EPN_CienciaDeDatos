import java.util.ArrayList;
import java.util.Random;

public class QuickSort {

    public static String generarCodigo() {
        Random random = new Random();
        StringBuilder resultado = new StringBuilder();

        String letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 3; i++) {
            resultado.append(letras.charAt(random.nextInt(letras.length())));
        }

        String numeros = "0123456789";
        for (int i = 0; i < 3; i++) {
            resultado.append(numeros.charAt(random.nextInt(numeros.length())));
        }

        return resultado.toString();
    }

    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();

        for (int i = 0; i <= 20; i++) {
            String codigo = generarCodigo();
            lista.add(codigo);
        }

        System.out.println("Antes: " + lista);
        QuickSort(lista, 0, lista.size() - 1);
        System.out.println("Después: " + lista);
    }

    public static ArrayList<String> QuickSort(ArrayList<String> lista, int bajo, int alto) {
        if (bajo < alto) {
            int indiceParticion = particion(lista, bajo, alto);
            System.out.println(lista);
            QuickSort(lista, bajo, indiceParticion - 1);
            QuickSort(lista, indiceParticion + 1, alto);
        }
        return lista;
    }

    public static int particion(ArrayList<String> lista, int bajo, int alto) {
        String pivote = lista.get(alto);
        int i = bajo - 1;
        for (int j = bajo; j < alto; j++) {
            if (lista.get(j).compareTo(pivote) <= 0) {
                i++;
                String temp = lista.get(i);
                lista.set(i, lista.get(j));
                lista.set(j, temp);
            }
        }
        String temp = lista.get(i + 1);
        lista.set(i + 1, lista.get(alto));
        lista.set(alto, temp);
        return i + 1;
    }
}
