/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

import javax.swing.JFrame;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

class RoundedPanel extends javax.swing.JPanel {
    private int radius = 20;

    public RoundedPanel(int radius) {
        this.radius = radius;
        setOpaque(false);
    }

    @Override
    protected void paintComponent(java.awt.Graphics g) {
        super.paintComponent(g);
        java.awt.Graphics2D g2 = (java.awt.Graphics2D) g;
        g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING, java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(getBackground());
        g2.fillRoundRect(0, 0, getWidth(), getHeight(), radius, radius);
    }
}



public class Workout extends javax.swing.JFrame {
    
    private static final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(Workout.class.getName());
    
    // simpan info user untuk query
    private String userBmiCategory; // underweight / normal / overweight / obese
    private String userExerciseType; // home / equipment / gym
    /**
     * Creates new form Monday
     */
    public Workout(JFrame previous) {
        initComponents();
        
        jList1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jList1.setFixedCellHeight(80);

        setLocationRelativeTo(null);
        
        if (previous != null) {
        this.setLocation(previous.getLocation());
    } else {
        this.setLocationRelativeTo(null);
    }
        
        home.setBorderPainted(false);
        home.setContentAreaFilled(false);
        home.setFocusPainted(false);
        home.setOpaque(false);
        
        workout.setBorderPainted(false);
        workout.setContentAreaFilled(false);
        workout.setFocusPainted(false);
        workout.setOpaque(false);
        
        food.setBorderPainted(false);
        food.setContentAreaFilled(false);
        food.setFocusPainted(false);
        food.setOpaque(false);
        
        skin.setBorderPainted(false);
        skin.setContentAreaFilled(false);
        skin.setFocusPainted(false);
        skin.setOpaque(false);
        
        // 1) ambil data user dulu
        loadUserProfile();
        
        loadWorkoutForDay("MONDAY");
    }

    
    private void loadUserProfile() {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DBConnection.getConnection();
        if (conn == null) {
            System.err.println("Koneksi DB gagal (Workout)");
            return;
        }

        String sql = "SELECT bmi_category, exercise_type FROM users " +
                     "WHERE bmi_category IS NOT NULL AND exercise_type IS NOT NULL " +
                     "ORDER BY id DESC LIMIT 1";
        ps = conn.prepareStatement(sql);

        rs = ps.executeQuery();
        if (rs.next()) {
            userBmiCategory = rs.getString("bmi_category");
            userExerciseType = rs.getString("exercise_type");

            System.out.println("User BMI: " + userBmiCategory);
            System.out.println("User Exercise Type: " + userExerciseType);
        } else {
            System.err.println("Tidak ada user dengan BMI & exercise_type yang terisi");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (ps != null) ps.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
}

            
     // ====================== LOAD WORKOUT PER HARI =========================        
    private void loadWorkoutForDay(String day) {
    // day harus salah satu dari: MONDAY, TUESDAY, ..., SUNDAY
    
    // jika data user belum ke-load, jangan lanjut
    if (userBmiCategory == null || userExerciseType == null) {
            Label1.setText("NO DATA");
            jList1.setListData(new String[]{"User profile belum lengkap."});
            return;
        }
    
    Connection conn = null;
    PreparedStatement psCat = null;
    PreparedStatement psItems = null;
    ResultSet rsCat = null;
    ResultSet rsItems = null;

    try {
        conn = DBConnection.getConnection();
        if (conn == null) {
            Label1.setText("DB ERROR");
            jList1.setListData(new String[]{"Tidak dapat terhubung ke database."});
            return;
        }
    
        // 1) Cari kategori workout yang cocok untuk BMI + preference + day
        String sqlCat =
            "SELECT id FROM workout_categories " +
            "WHERE bmi_category = ? AND workout_preference = ? AND day = ?";

        psCat = conn.prepareStatement(sqlCat);
        psCat.setString(1, userBmiCategory);      // contoh "underweight"
        psCat.setString(2, mapExerciseTypeToPreference(userExerciseType));
        psCat.setString(3, day);                  // "MONDAY" dll

        rsCat = psCat.executeQuery();

        Long categoryId = null;
        if (rsCat.next()) {
            categoryId = rsCat.getLong("id");
        }

        if (categoryId == null) {
            // tidak ada workout untuk kombinasi itu
            Label1.setText(userBmiCategory.toUpperCase());
            jList1.setListData(new String[]{
                "Belum ada jadwal workout untuk:",
                "- BMI: " + userBmiCategory,
                "- Type: " + userExerciseType,
                "- Day: " + day
            });
            return;
        }
        
        // 2) Ambil semua item workout untuk kategori & day itu
        String sqlItems =
            "SELECT name, detail FROM workout_items " +
            "WHERE workout_category_id = ? AND day = ? " +
            "ORDER BY id ASC";

        psItems = conn.prepareStatement(sqlItems);
        psItems.setLong(1, categoryId);
        psItems.setString(2, day);

        rsItems = psItems.executeQuery();

        List<String> workoutLines = new ArrayList<>();
        while (rsItems.next()) {
            String name = rsItems.getString("name");
            String detail = rsItems.getString("detail"); // bisa null
            if (detail != null && !detail.isEmpty()) {
                workoutLines.add(name + " — " + detail);
            } else {
                workoutLines.add(name);
            }
        }

        if (workoutLines.isEmpty()) {
            workoutLines.add("Belum ada workout di hari ini.");
        }

        // 3) Update UI
        Label1.setText(day);  // MONDAY / TUESDAY / dst
        jList1.setListData(workoutLines.toArray(new String[0]));


        } catch (Exception e) {
            e.printStackTrace();
            Label1.setText("ERROR");
            jList1.setListData(new String[]{"Terjadi error saat mengambil data workout."});
        } finally {
            try { if (rsItems != null) rsItems.close(); } catch (Exception ignored) {}
            try { if (rsCat != null) rsCat.close(); } catch (Exception ignored) {}
            try { if (psItems != null) psItems.close(); } catch (Exception ignored) {}
            try { if (psCat != null) psCat.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
        
    // Map exercise_type dari users ke enum workout_preference
    private String mapExerciseTypeToPreference(String exerciseType) {
        // users.exercise_type = 'home', 'equipment', 'gym'
        // workout_preference = 'gym', 'home_no_equipment', 'home_equipment'
        if (exerciseType == null) return "gym";

        switch (exerciseType) {
            case "home":
                return "home_no_equipment";
            case "equipment":
                return "home_equipment";
            case "gym":
            default:
                return "gym";
        }
    }

   
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        Sunday = new javax.swing.JButton();
        Monday = new javax.swing.JButton();
        Saturday = new javax.swing.JButton();
        Thursday = new javax.swing.JButton();
        Tuesday = new javax.swing.JButton();
        Friday = new javax.swing.JButton();
        Wednesday = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        Label1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jPanel3 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        home = new javax.swing.JButton();
        workout = new javax.swing.JButton();
        skin = new javax.swing.JButton();
        food = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(20, 31, 35));
        jPanel1.setForeground(new java.awt.Color(20, 31, 35));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Sunday.setBackground(new java.awt.Color(51, 51, 255));
        Sunday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Sunday.setText("S");
        Sunday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SundayActionPerformed(evt);
            }
        });
        jPanel1.add(Sunday, new org.netbeans.lib.awtextra.AbsoluteConstraints(263, 30, 40, 70));

        Monday.setBackground(new java.awt.Color(255, 51, 51));
        Monday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Monday.setText("M");
        Monday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MondayActionPerformed(evt);
            }
        });
        jPanel1.add(Monday, new org.netbeans.lib.awtextra.AbsoluteConstraints(23, 30, 40, 70));

        Saturday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Saturday.setText("S");
        Saturday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SaturdayActionPerformed(evt);
            }
        });
        jPanel1.add(Saturday, new org.netbeans.lib.awtextra.AbsoluteConstraints(223, 30, 40, 70));

        Thursday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Thursday.setText("T");
        Thursday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ThursdayActionPerformed(evt);
            }
        });
        jPanel1.add(Thursday, new org.netbeans.lib.awtextra.AbsoluteConstraints(143, 30, 40, 70));

        Tuesday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Tuesday.setText("T");
        Tuesday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                TuesdayActionPerformed(evt);
            }
        });
        jPanel1.add(Tuesday, new org.netbeans.lib.awtextra.AbsoluteConstraints(63, 30, 40, 70));

        Friday.setBackground(new java.awt.Color(255, 51, 51));
        Friday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Friday.setText("F");
        Friday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                FridayActionPerformed(evt);
            }
        });
        jPanel1.add(Friday, new org.netbeans.lib.awtextra.AbsoluteConstraints(183, 30, 40, 70));

        Wednesday.setBackground(new java.awt.Color(51, 51, 255));
        Wednesday.setFont(new java.awt.Font("Segoe UI", 1, 8)); // NOI18N
        Wednesday.setText("W");
        Wednesday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                WednesdayActionPerformed(evt);
            }
        });
        jPanel1.add(Wednesday, new org.netbeans.lib.awtextra.AbsoluteConstraints(103, 30, 40, 70));

        Label1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        Label1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Label1.setText("xx");

        jList1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jList1.setModel(new javax.swing.AbstractListModel<String>() {
            String[] strings = { "Dumbbel Press — 4 x 10", "Pike Push-up — 3 x 8", "DB Row — 4 x 12", "Bicep Curl — 3 x 10", "Tricep Extension — 3 x 12" };
            public int getSize() { return strings.length; }
            public String getElementAt(int i) { return strings[i]; }
        });
        jList1.setFixedCellHeight(80);
        jScrollPane1.setViewportView(jList1);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Label1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 278, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(Label1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 311, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(10, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 80, 290, 390));

        jPanel3.setBackground(new java.awt.Color(61, 76, 85));

        jPanel4.setBackground(new java.awt.Color(20, 31, 35));

        home.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/main1.png"))); // NOI18N
        home.setToolTipText("");
        home.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                homeActionPerformed(evt);
            }
        });

        workout.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/workout2.png"))); // NOI18N
        workout.setToolTipText("");
        workout.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                workoutActionPerformed(evt);
            }
        });

        skin.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/skin2.png"))); // NOI18N
        skin.setToolTipText("");
        skin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                skinActionPerformed(evt);
            }
        });

        food.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/food1.png"))); // NOI18N
        food.setToolTipText("");
        food.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                foodActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(home, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(workout, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(food, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(skin, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(32, 32, 32))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(workout, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(home, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(skin, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(food, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18))
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 480, 330, -1));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void MondayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MondayActionPerformed
        loadWorkoutForDay("MONDAY");
    }//GEN-LAST:event_MondayActionPerformed

    private void ThursdayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ThursdayActionPerformed
        loadWorkoutForDay("THURSDAY");
    }//GEN-LAST:event_ThursdayActionPerformed

    private void TuesdayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_TuesdayActionPerformed
        loadWorkoutForDay("TUESDAY");
    }//GEN-LAST:event_TuesdayActionPerformed

    private void FridayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_FridayActionPerformed
        loadWorkoutForDay("FRIDAY");
    }//GEN-LAST:event_FridayActionPerformed

    private void SundayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SundayActionPerformed
        loadWorkoutForDay("SUNDAY");
    }//GEN-LAST:event_SundayActionPerformed

    private void SaturdayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SaturdayActionPerformed
        loadWorkoutForDay("SATURDAY");
    }//GEN-LAST:event_SaturdayActionPerformed

    private void WednesdayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_WednesdayActionPerformed
        loadWorkoutForDay("WEDNESDAY");
    }//GEN-LAST:event_WednesdayActionPerformed

    private void homeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_homeActionPerformed
        Main mainpagePage = new Main(this);
        mainpagePage.setVisible(true);
        this.dispose();// TODO add your handling code here:
    }//GEN-LAST:event_homeActionPerformed

    private void workoutActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_workoutActionPerformed
        Workout MondayPage = new Workout(this);
        MondayPage.setVisible(true);
        this.dispose();// TODO add your handling code here:
    }//GEN-LAST:event_workoutActionPerformed

    private void foodActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_foodActionPerformed
        Calories TEST1Page = new Calories(this);
        TEST1Page.setVisible(true);
        this.dispose();// TODO add your handling code here:
    }//GEN-LAST:event_foodActionPerformed

    private void skinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_skinActionPerformed
        Skincare SkincareFrameV2Page = new Skincare(this);
        SkincareFrameV2Page.setVisible(true);
        this.dispose();// TODO add your handling code here:
    }//GEN-LAST:event_skinActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
            if ("Nimbus".equals(info.getName())) {
                javax.swing.UIManager.setLookAndFeel(info.getClassName());
                break;
            }
        }
    } catch (ReflectiveOperationException | javax.swing.UnsupportedLookAndFeelException ex) {
        logger.log(java.util.logging.Level.SEVERE, null, ex);
    }

    /* Create and display the form */
    java.awt.EventQueue.invokeLater(() -> new Workout(null).setVisible(true));
}

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Friday;
    private javax.swing.JLabel Label1;
    private javax.swing.JButton Monday;
    private javax.swing.JButton Saturday;
    private javax.swing.JButton Sunday;
    private javax.swing.JButton Thursday;
    private javax.swing.JButton Tuesday;
    private javax.swing.JButton Wednesday;
    private javax.swing.JButton food;
    private javax.swing.JButton home;
    private javax.swing.JList<String> jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton skin;
    private javax.swing.JButton workout;
    // End of variables declaration//GEN-END:variables
}
