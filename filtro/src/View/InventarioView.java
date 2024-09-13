package View;

import Model.InventarioVehiculo;
import Model.InventarioDAO;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class InventarioView {
    private final InventarioDAO inventarioDAO;
    private final Scanner scanner;

    public InventarioView(InventarioDAO inventarioDAO) {
        this.inventarioDAO = inventarioDAO;
        this.scanner = new Scanner(System.in);
    }

    public void displayMenu() {
        int option = 0;
        boolean validInput = false;

        do {
            System.out.println("\n╔═════════════════════════════════════════════════════════════╗");
            System.out.println("║                                                             ║");
            System.out.println("║              🚗  MENÚ DE GESTIÓN DE INVENTARIO              🚗  ║");
            System.out.println("║                                                             ║");
            System.out.println("╠═════════════════════════════════════════════════════════════╣");
            System.out.println("║                                                             ║");
            System.out.println("║    1️⃣.  |  🗂️  Crear Vehículo                                 ║");
            System.out.println("║    2️⃣.  |  📄  Ver Vehículos                                  ║");
            System.out.println("║    3️⃣.  |  🔄  Actualizar Vehículo                            ║");
            System.out.println("║    4️⃣.  |  🔙  Volver                                        ║");
            System.out.println("║                                                             ║");
            System.out.println("╚═════════════════════════════════════════════════════════════╝");
            System.out.print("Elige una opción: ");

            while (!validInput) {
                try {
                    option = scanner.nextInt();
                    scanner.nextLine();
                    validInput = true;
                } catch (InputMismatchException e) {
                    System.out.println("Error: Entrada inválida. Debe ser un número entero.");
                    scanner.next();
                }
            }

            switch (option) {
                case 1:
                    crearVehiculo();
                    break;
                case 2:
                    listarVehiculos();
                    break;
                case 3:
                    actualizarVehiculo();
                    break;
                case 4:
                    System.out.println("🔙 Volviendo al menú principal");
                    break;
                default:
                    System.out.println("🚫 Opción inválida. Inténtalo de nuevo.");
            }

            validInput = false;
        } while (option != 4);
    }

    public void crearVehiculo() {
        System.out.println("╔═════════════════════════════════════════════════════════════╗");
        System.out.print("║                   🚗 Marca del Vehículo: ");
        String marca = scanner.nextLine();
        System.out.println("╠═════════════════════════════════════════════════════════════");

        System.out.println("╔═════════════════════════════════════════════════════════════╗");
        System.out.print("║                   🚗 Modelo del Vehículo: ");
        String modelo = scanner.nextLine();
        System.out.println("╠═════════════════════════════════════════════════════════════");

        System.out.println("╔═════════════════════════════════════════════════════════════╗");
        System.out.print("║                   📅 Año del Vehículo: ");
        int año = scanner.nextInt();
        scanner.nextLine();
        System.out.println("╠═════════════════════════════════════════════════════════════");

        System.out.println("╔═════════════════════════════════════════════════════════════╗");
        System.out.print("║                   💵 Precio del Vehículo: ");
        int precio = scanner.nextInt();
        scanner.nextLine();
        System.out.println("╠═════════════════════════════════════════════════════════════");

        System.out.println("╔═════════════════════════════════════════════════════════════╗");
        System.out.print("║                   🏷️ Estado del Vehículo (Nuevo/Usado): ");
        String estado = scanner.nextLine();

        // Validar el estado
        if (!estado.equalsIgnoreCase("Nuevo") && !estado.equalsIgnoreCase("Usado")) {
            System.out.println("Error: Estado inválido. Debe ser 'Nuevo' o 'Usado'.");
            return;
        }

        InventarioVehiculo vehiculo = new InventarioVehiculo();
        vehiculo.setMarca(marca);
        vehiculo.setModelo(modelo);
        vehiculo.setAño(año);
        vehiculo.setPrecio(precio);
        vehiculo.setEstado(estado);

        inventarioDAO.createVehiculo(vehiculo);

        System.out.println("🎉 Vehículo creado con éxito.");
    }



    private void listarVehiculos() {
        try {
            List<InventarioVehiculo> vehiculos = inventarioDAO.getAllVehiculos();
            if (vehiculos.isEmpty()) {
                System.out.println("🔍  No hay vehículos disponibles.");
            } else {
                System.out.println("╔═════╤═════════════════════╤════════════════════╤════════════╤══════════╤═══════════╗");
                System.out.println("║ ID  │ Marca               │ Modelo             │ Año        │ Precio   │ Estado    ║");
                System.out.println("╠═════╪═════════════════════╪════════════════════╪════════════╪══════════╪═══════════╢");

                for (InventarioVehiculo vehiculo : vehiculos) {
                    System.out.printf("║ %-3d │ %-19s │ %-20s │ %-10d │ %-8d │ %-9s ║\n",
                        vehiculo.getIdVehiculo(),
                        truncateString(vehiculo.getMarca(), 19),
                        truncateString(vehiculo.getModelo(), 20),
                        vehiculo.getAño(),
                        vehiculo.getPrecio(),
                        vehiculo.getEstado());
                }

                System.out.println("╚═════╩═════════════════════╩═════════════════════╩════════════╩══════════╩═══════════╝");
                System.out.println("Escribe cualquier cosa para continuar");
                scanner.next();
            }
        } catch (Exception e) {
            System.out.println("🚨  Error al obtener los vehículos.");
            e.printStackTrace();
        }
    }

    private void actualizarVehiculo() {
        System.out.print("Ingrese el ID del vehículo que desea actualizar: ");
        int id = scanner.nextInt();
        scanner.nextLine();

        System.out.println("Ingrese los nuevos valores para el vehículo. Deje en blanco si no desea cambiar un campo.");

        System.out.print("Nueva marca: ");
        String nuevaMarca = scanner.nextLine();

        System.out.print("Nuevo modelo: ");
        String nuevoModelo = scanner.nextLine();

        System.out.print("Nuevo año: ");
        String inputAño = scanner.nextLine();
        int nuevoAño = inputAño.isEmpty() ? -1 : Integer.parseInt(inputAño);

        System.out.print("Nuevo precio: ");
        String inputPrecio = scanner.nextLine();
        int nuevoPrecio = inputPrecio.isEmpty() ? -1 : Integer.parseInt(inputPrecio);

        System.out.print("Nuevo estado: ");
        String nuevoEstado = scanner.nextLine();

        InventarioVehiculo vehiculo = new InventarioVehiculo();
        vehiculo.setIdVehiculo(id);

        if (!nuevaMarca.isEmpty()) vehiculo.setMarca(nuevaMarca);
        if (!nuevoModelo.isEmpty()) vehiculo.setModelo(nuevoModelo);
        if (nuevoAño != -1) vehiculo.setAño(nuevoAño);
        if (nuevoPrecio != -1) vehiculo.setPrecio(nuevoPrecio);
        if (!nuevoEstado.isEmpty()) vehiculo.setEstado(nuevoEstado);

        inventarioDAO.updateVehiculo(vehiculo);
        System.out.println("🎉 Vehículo actualizado con éxito.");
    }

    private String truncateString(String str, int maxLength) {
        if (str.length() > maxLength) {
            return str.substring(0, maxLength - 3) + "...";
        }
        return str;
    }
}
