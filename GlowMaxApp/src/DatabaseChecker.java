import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Logger;

public class DatabaseChecker {
    
    private static final Logger logger = Logger.getLogger(DatabaseChecker.class.getName());
    
    /**
     * Check apakah tabel users kosong
     * @param conn Connection ke database
     * @return true jika kosong, false jika ada data
     */
    public static boolean isUsersTableEmpty(Connection conn) {
        try {
            String query = "SELECT COUNT(*) FROM users";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                int count = rs.getInt(1);
                rs.close();
                stmt.close();
                return count == 0;
            }
            
            rs.close();
            stmt.close();
            
        } catch (Exception e) {
            logger.log(java.util.logging.Level.SEVERE, "Error checking users table: " + e.getMessage());
        }
        
        return false;
    }
    
    /**
     * Ambil userId pertama dari database
     * @param conn Connection ke database
     * @return userId jika ada, 0 jika tidak ada
     */
    public static long getFirstUserIdFromDatabase(Connection conn) {
        try {
            String query = "SELECT id FROM users LIMIT 1";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                long userId = rs.getLong("id");
                rs.close();
                stmt.close();
                System.out.println("✅ User ID ditemukan: " + userId);
                return userId;
            }
            
            rs.close();
            stmt.close();
            
        } catch (Exception e) {
            logger.log(java.util.logging.Level.SEVERE, "Error getting user id: " + e.getMessage());
        }
        
        return 0;
    }
    
    /**
     * Check apakah connection aktif
     * @param conn Connection ke database
     * @return true jika berhasil terhubung
     */
    public static boolean isConnected(Connection conn) {
        try {
            return conn != null && !conn.isClosed();
        } catch (Exception e) {
            logger.log(java.util.logging.Level.SEVERE, "Connection error: " + e.getMessage());
            return false;
        }
    }
}
