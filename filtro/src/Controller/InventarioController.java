package Controller;

import Model.InventarioDAO;
import Model.InventarioVehiculo;
import View.InventarioView;
import java.sql.Connection;
import java.util.List;

public class InventarioController {
    private final InventarioView inventarioView;
    private final InventarioDAO inventarioDAO;

    public InventarioController(Connection connection) {
        this.inventarioDAO = new InventarioDAO(connection);
        this.inventarioView = new InventarioView(this.inventarioDAO);
    }

    public void iniciar() {
        inventarioView.displayMenu();
    }

    public void createVehiculo(InventarioVehiculo vehiculo) {
        inventarioDAO.createVehiculo(vehiculo);
    }

    public void updateVehiculo(InventarioVehiculo vehiculo) {
        inventarioDAO.updateVehiculo(vehiculo);
    }

    public List<InventarioVehiculo> getAllVehiculos() {
        return inventarioDAO.getAllVehiculos();
    }
}
