import java.util.ArrayList;

public class OrdenarProductosScore {

    public static void main(String[] args) {
        ArrayList<Producto> productos = new ArrayList<>();

        productos.add(new Producto(1, 30, 4.4, 10));
        productos.add(new Producto(2, 100, 4.1, 20));
        productos.add(new Producto(3, 10, 5.0, 10));
        productos.add(new Producto(4, 31, 3.2, 5));
        productos.add(new Producto(5, 39, 5.0, 0));
        productos.add(new Producto(6, 56, 1.2, 9));
        productos.add(new Producto(7, 120, 0.1, 8));
        productos.add(new Producto(8, 75, 5.0, 5));
        productos.add(new Producto(9, 98, 4.7, 10));
        productos.add(new Producto(10, 40, 4.9, 8));

        ArrayList<Producto> productosOrdenados = bubbleSort(productos);

        // Imprimir ID y Score
        for (Producto p : productosOrdenados) {
            System.out.printf("ID: %d, Score: %.4f%n", p.id, p.score());
        }
    }

    public static ArrayList<Producto> bubbleSort(ArrayList<Producto> lista) {
        int n = lista.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - 1 - i; j++) {
                if (lista.get(j).score() < lista.get(j + 1).score()) {
                    Producto aux = lista.get(j);
                    lista.set(j, lista.get(j + 1));
                    lista.set(j + 1, aux);
                }
            }
        }
        return lista;
    }
}
