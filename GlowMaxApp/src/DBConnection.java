/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Acer
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/glowmax?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // isi kalau database kamu ada password

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Koneksi ke database berhasil!");
            return conn;

        } catch (ClassNotFoundException e) {
            System.err.println("❌ Driver MySQL tidak ditemukan!");
            System.err.println(e.getMessage());
        } catch (SQLException e) {
            System.err.println("❌ Koneksi ke database gagal!");
            System.err.println(e.getMessage());
        }
        return null;
    }
}
