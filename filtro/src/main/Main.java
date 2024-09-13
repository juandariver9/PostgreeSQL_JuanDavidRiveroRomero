package main;

import Database.Conection;
import Controller.InventarioController;
import View.InventarioView;
import Model.InventarioDAO;
import java.sql.Connection;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Conection con = new Conection();
        Connection connection = null;

        try {
            connection = con.getConnection();

            // Iniciar controladores
            InventarioController inventarioController = new InventarioController(connection);

            // Iniciar el menú principal
            int option;
            do {
                System.out.println("╔═══════════════════════════════════════════════════════════════════╗");
                System.out.println("║                                                                   ║");
                System.out.println("║              BIENVENIDO AL SISTEMA DE CAMPUS CARS                 ║");
                System.out.println("║                                                                   ║");
                System.out.println("╠═══════════════════════════════════════════════════════════════════╣");
                System.out.println("║                                                                   ║");
                System.out.println("║    1. Gestión de Inventario                                       ║");
                System.out.println("║    2. Gestión de Clientes                                         ║");
                System.out.println("║    3. Gestión de Ventas                                           ║");
                System.out.println("║    4. Gestión de Proveedores                                      ║");
                System.out.println("║    5. Gestión de Empleados                                        ║");
                System.out.println("║    6. Gestión de Servicios                                        ║");
                System.out.println("║    7. Gestión de Departamentos                                    ║");
                System.out.println("║    8. Salir                                                       ║");
                System.out.println("║                                                                   ║");
                System.out.println("╚═══════════════════════════════════════════════════════════════════╝");
                System.out.print("Elige una opción: ");
                option = scanner.nextInt();
                scanner.nextLine(); // Limpiar el buffer

                switch (option) {
                    case 1:
                        System.out.println("Mostrando gestión de inventario...");
                        inventarioController.iniciar();
                        break;
                    case 2:
                        System.out.println("Mostrando gestión de clientes...");
                        // clientesView.displayMenu();
                        break;
                    case 3:
                        System.out.println("Mostrando gestión de ventas...");
                        // ventasView.displayMenu();
                        break;
                    case 4:
                        System.out.println("Mostrando gestión de proveedores...");
                        // proveedoresView.displayMenu();
                        break;
                    case 5:
                        System.out.println("Mostrando gestión de empleados...");
                        // empleadosView.displayMenu();
                        break;
                    case 6:
                        System.out.println("Mostrando gestión de servicios...");
                        // serviciosView.displayMenu();
                        break;
                    case 7:
                        System.out.println("Mostrando gestión de departamentos...");
                        // departamentosView.displayMenu();
                        break;
                    case 8:
                        System.out.println("Saliendo del sistema...");
                        break;
                    default:
                        System.out.println("Opción no válida. Inténtalo de nuevo.");
                }

            } while (option != 8);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    con.closeConnection();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            scanner.close();
        }
    }
}