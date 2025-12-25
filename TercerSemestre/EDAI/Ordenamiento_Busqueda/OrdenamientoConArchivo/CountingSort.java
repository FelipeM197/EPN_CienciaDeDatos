import java.io.*;
import java.util.ArrayList;
import java.util.Collections;

public class CountingSort {

    public static void main(String[] args) {
        ArrayList<Float> ListaNum = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader("src/archivo_float.txt"))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                Float num = Float.parseFloat(linea);
                ListaNum.add(num);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        ArrayList<Float> resultado = countingSort(ListaNum);

        try (BufferedWriter bw = new BufferedWriter(new FileWriter("Resultado.txt"))) {
            for (Float num : resultado) {
                bw.write(String.format("%.6f", num));
                bw.newLine();
            }
            System.out.println("Se creo el archivo");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Float> countingSort(ArrayList<Float> lista) {
        ArrayList<Float> resultado = new ArrayList<>();

        if (lista.isEmpty()) return resultado;

        int factor = 1_000_000;
        int n = lista.size();

        int[] valoresAbsolutos = new int[n];
        int[] indicesOriginales = new int[n];

        int max = 0;

        for (int i = 0; i < n; i++) {
            float valor = lista.get(i);

            //Al ser counting sort debo multiplicar por un factor que los vuelva a todos enteros
            int valorAbs = Math.round(Math.abs(valor) * factor);
            valoresAbsolutos[i] = valorAbs;
            indicesOriginales[i] = i;
            if (valorAbs > max) max = valorAbs;
        }

        int[] conteo = new int[max + 1];

        for (int valor : valoresAbsolutos) {
            conteo[valor]++;
        }

        for (int i = 1; i < conteo.length; i++) {
            conteo[i] += conteo[i - 1];
        }

        Float[] resultadoTemp = new Float[n];

        for (int i = n - 1; i >= 0; i--) {
            int valorAbs = valoresAbsolutos[i];
            int pos = conteo[valorAbs] - 1;
            resultadoTemp[pos] = lista.get(i);
            conteo[valorAbs]--;
        }

        for (Float valor : resultadoTemp) {
            resultado.add(valor);
        }

        return resultado;
    }
}
