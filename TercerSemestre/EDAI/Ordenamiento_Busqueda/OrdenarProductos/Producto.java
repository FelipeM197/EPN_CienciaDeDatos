public class Producto {

    int id;
    int ventas;
    Double rating;
    int devoluciones;


    public Producto(int id, int ventas, Double rating, int devoluciones) {
        this.id = id;
        this.ventas = ventas;
        this.rating = rating;
        this.devoluciones = devoluciones;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public int getDevoluciones() {
        return devoluciones;
    }

    public void setDevoluciones(int devoluciones) {
        this.devoluciones = devoluciones;
    }

    public int getVentas() {
        return ventas;
    }

    public void setVentas(int ventas) {
        this.ventas = ventas;
    }

    public double score() {
        double score = (ventas * 0.5) + (rating * 0.4) + (devoluciones * 0.1);
        return score;
    }
}
