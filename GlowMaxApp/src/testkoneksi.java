/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
/**
 *
 * @author Acer
 */
public class testkoneksi {
    public static void main(String[] args) {

        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            System.out.println("✅ Koneksi ke database BERHASIL");
        } else {
            System.out.println("❌ Koneksi ke database GAGAL");
        }
    }
}
