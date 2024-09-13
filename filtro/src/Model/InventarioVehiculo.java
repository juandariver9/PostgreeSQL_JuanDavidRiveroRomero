package Model;

public class InventarioVehiculo {
    private Integer idVehiculo;
    private String marca;
    private String modelo;
    private Integer año;
    private Integer precio;
    private String estado;// Dependiendo de cómo definas "estado", puedes cambiar el tipo si es un enum

    // Constructor vacío
    public InventarioVehiculo() {}

    // Constructor con parámetros
    public InventarioVehiculo(int idVehiculo, String marca, String modelo, int año, int precio, String estado) {
        this.idVehiculo = idVehiculo;
        this.marca = marca;
        this.modelo = modelo;
        this.año = año;
        this.precio = precio;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Integer getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
