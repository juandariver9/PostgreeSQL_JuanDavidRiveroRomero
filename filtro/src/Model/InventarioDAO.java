package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventarioDAO {
    private final Connection connection;

    // Constructor que acepta una conexión
    public InventarioDAO(Connection connection) {
        this.connection = connection;
    }

    public void createVehiculo(InventarioVehiculo vehiculo) {
        String query = "INSERT INTO InventarioVehiculo (marca, modelo, año, precio, estado) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, vehiculo.getMarca());
            stmt.setString(2, vehiculo.getModelo());
            stmt.setInt(3, vehiculo.getAño());
            stmt.setInt(4, vehiculo.getPrecio());
            stmt.setObject(5, vehiculo.getEstado(), java.sql.Types.OTHER); // Usar Types.OTHER para enums
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al crear el vehículo.");
        }
    }




    public void updateVehiculo(InventarioVehiculo vehiculo) {
        StringBuilder queryBuilder = new StringBuilder("UPDATE inventarioVehiculo SET ");
        List<Object> parameters = new ArrayList<>();

        if (vehiculo.getMarca() != null) {
            queryBuilder.append("marca = ?, ");
            parameters.add(vehiculo.getMarca());
        }
        if (vehiculo.getModelo() != null) {
            queryBuilder.append("modelo = ?, ");
            parameters.add(vehiculo.getModelo());
        }
        if (vehiculo.getAño() != null) {
            queryBuilder.append("año = ?, ");
            parameters.add(vehiculo.getAño());
        }
        if (vehiculo.getPrecio() != null) {
            queryBuilder.append("precio = ?, ");
            parameters.add(vehiculo.getPrecio());
        }
        if (vehiculo.getEstado() != null) {
            queryBuilder.append("estado = ?, ");
            parameters.add(vehiculo.getEstado());
        }

        // Elimina la última coma y espacio
        if (queryBuilder.toString().endsWith(", ")) {
            queryBuilder.setLength(queryBuilder.length() - 2);
        }
        queryBuilder.append(" WHERE id_vehiculo = ?");
        parameters.add(vehiculo.getIdVehiculo());

        try (PreparedStatement statement = connection.prepareStatement(queryBuilder.toString())) {
            for (int i = 0; i < parameters.size(); i++) {
                Object param = parameters.get(i);
                if (param instanceof Integer) {
                    statement.setInt(i + 1, (Integer) param);
                } else if (param instanceof String) {
                    statement.setString(i + 1, (String) param);
                } else {
                    statement.setObject(i + 1, param); // Para enums y otros tipos
                }
            }
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al actualizar el vehículo.");
        }
    }






    public List<InventarioVehiculo> getAllVehiculos() {
        List<InventarioVehiculo> vehiculos = new ArrayList<>();
        String query = "SELECT * FROM inventarioVehiculo";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                InventarioVehiculo vehiculo = new InventarioVehiculo();
                vehiculo.setIdVehiculo(resultSet.getInt("id_vehiculo"));
                vehiculo.setMarca(resultSet.getString("marca"));
                vehiculo.setModelo(resultSet.getString("modelo"));
                vehiculo.setAño(resultSet.getInt("año"));
                vehiculo.setPrecio(resultSet.getInt("precio"));
                vehiculo.setEstado(resultSet.getString("estado"));
                vehiculos.add(vehiculo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehiculos;
    }
}
