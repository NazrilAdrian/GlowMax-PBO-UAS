import javax.swing.JFrame;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.DefaultListModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author Rafli
 */
public class Calories extends javax.swing.JFrame {
    
    private static final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(Calories.class.getName());

    /**
     * Creates new form TEST1
     */
    public Calories(JFrame previous) {
        initComponents();
        
       
        this.setMinimumSize(new java.awt.Dimension(330, 625));
        setPreferredSize(new java.awt.Dimension(330, 580));
        setSize(340, 590);
        setResizable(false);
        
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
         loadTitleFromDatabase();
         loadFoodForMeal("breakfast");
    }
    // ====== AMBIL BMI CATEGORY USER ======


// ====== LOAD MAKANAN BERDASARKAN MEAL TYPE ======
// Ambil kategori BMI user dari tabel users
private String getUserBmiCategory() throws Exception {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DBConnection.getConnection();
        String sql = "SELECT bmi_category FROM users WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setLong(1, start.Session.userId);
        rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getString("bmi_category");   // underweight/normal/overweight/obese
        } else {
            return null;
        }
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (ps != null) ps.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
}

// Load daftar makanan ke JList berdasarkan mealType: breakfast/lunch/snack/dinner
private void loadFoodForMeal(String mealType) {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        String bmiCat = getUserBmiCategory();
        if (bmiCat == null || bmiCat.isEmpty()) {
            DefaultListModel<String> model = new DefaultListModel<>();
            model.addElement("BMI belum dihitung");
            foodList.setModel(model);
            return;
        }

        conn = DBConnection.getConnection();
        if (conn == null) {
            DefaultListModel<String> model = new DefaultListModel<>();
            model.addElement("Koneksi DB gagal");
            foodList.setModel(model);
            return;
        }

        // 1) cari id kategori berdasarkan bmi_category + meal_type
        String sqlCat = "SELECT id FROM food_categories WHERE bmi_category = ? AND meal_type = ?";
        ps = conn.prepareStatement(sqlCat);
        ps.setString(1, bmiCat);        // contoh: "underweight"
        ps.setString(2, mealType);      // contoh: "breakfast"
        rs = ps.executeQuery();

        Long catId = null;
        if (rs.next()) {
            catId = rs.getLong("id");
        }

        rs.close();
        ps.close();

        DefaultListModel<String> model = new DefaultListModel<>();

        if (catId == null) {
            model.addElement("Tidak ada kategori untuk " + bmiCat + " - " + mealType);
            foodList.setModel(model);
            return;
        }

        // 2) ambil semua food_items utk category tsb
        String sqlItems = "SELECT name FROM food_items WHERE food_category_id = ?";
        ps = conn.prepareStatement(sqlItems);
        ps.setLong(1, catId);
        rs = ps.executeQuery();

        while (rs.next()) {
            model.addElement(rs.getString("name"));
        }

        if (model.isEmpty()) {
            model.addElement("Belum ada item makanan");
        }

        // set ke JList
        foodList.setModel(model);

    } catch (Exception e) {
        e.printStackTrace();
        DefaultListModel<String> model = new DefaultListModel<>();
        model.addElement("Terjadi error: " + e.getMessage());
        foodList.setModel(model);
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (ps != null) ps.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
}


    
    private void loadTitleFromDatabase() {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DBConnection.getConnection();

        if (conn == null) {
            System.err.println("ERROR: Koneksi DB gagal");
            jLabel1.setText("UNKNOWN");   // ganti jLabel1 dengan nama label judulmu
            return;
        }

        String sql = "SELECT bmi_category FROM users WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setLong(1, start.Session.userId);

        rs = ps.executeQuery();

        if (rs.next()) {
            String bmiCat = rs.getString("bmi_category");

            if (bmiCat == null || bmiCat.isEmpty()) {
                jLabel1.setText("UNKNOWN");
            } else {
                String formatted =
                        bmiCat.substring(0, 1).toUpperCase() +
                        bmiCat.substring(1).toLowerCase();
                jLabel1.setText(formatted);
                System.out.println("Title diset ke: " + formatted);
            }
        } else {
            jLabel1.setText("UNKNOWN");
        }

    } catch (Exception e) {
        e.printStackTrace();
        jLabel1.setText("ERROR");
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
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
        btnLunch = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        foodList = new javax.swing.JList<>();
        jLabel1 = new javax.swing.JLabel();
        btnSnack = new javax.swing.JButton();
        btnDinner = new javax.swing.JButton();
        btnBreakfast = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        home = new javax.swing.JButton();
        workout = new javax.swing.JButton();
        skin = new javax.swing.JButton();
        food = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setSize(new java.awt.Dimension(330, 580));

        jPanel1.setBackground(new java.awt.Color(20, 31, 35));
        jPanel1.setPreferredSize(new java.awt.Dimension(350, 580));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnLunch.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/Desain tanpa judul (2) (1) (3).png"))); // NOI18N
        btnLunch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLunchActionPerformed(evt);
            }
        });
        jPanel1.add(btnLunch, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 70, 70, 58));

        foodList.setBackground(new java.awt.Color(0, 102, 255));
        foodList.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        foodList.setForeground(new java.awt.Color(255, 255, 255));
        foodList.setModel(new javax.swing.AbstractListModel<String>() {
            String[] strings = { "Item1" };
            public int getSize() { return strings.length; }
            public String getElementAt(int i) { return strings[i]; }
        });
        foodList.setFixedCellHeight(80);
        jScrollPane1.setViewportView(foodList);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(-2, 145, 330, 330));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 36)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("JLabel");
        jLabel1.addAncestorListener(new javax.swing.event.AncestorListener() {
            public void ancestorAdded(javax.swing.event.AncestorEvent evt) {
                jLabel1AncestorAdded(evt);
            }
            public void ancestorMoved(javax.swing.event.AncestorEvent evt) {
            }
            public void ancestorRemoved(javax.swing.event.AncestorEvent evt) {
            }
        });
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 310, -1));

        btnSnack.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/SNACK (1) (1).png"))); // NOI18N
        btnSnack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSnackActionPerformed(evt);
            }
        });
        jPanel1.add(btnSnack, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 70, 70, 58));

        btnDinner.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/DINNER (1) (1).png"))); // NOI18N
        btnDinner.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDinnerActionPerformed(evt);
            }
        });
        jPanel1.add(btnDinner, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 70, 60, 58));

        btnBreakfast.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gambar/BREAKFAST (1) (1) (1).png"))); // NOI18N
        btnBreakfast.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBreakfastActionPerformed(evt);
            }
        });
        jPanel1.add(btnBreakfast, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 70, 70, 58));

        jPanel3.setBackground(new java.awt.Color(61, 76, 85));

        jPanel4.setBackground(new java.awt.Color(20, 31, 35));

        home.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/main1.png"))); // NOI18N
        home.setToolTipText("");
        home.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                homeActionPerformed(evt);
            }
        });

        workout.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/workout1.png"))); // NOI18N
        workout.setToolTipText("");
        workout.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                workoutActionPerformed(evt);
            }
        });

        skin.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/skin1.png"))); // NOI18N
        skin.setToolTipText("");
        skin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                skinActionPerformed(evt);
            }
        });

        food.setIcon(new javax.swing.ImageIcon(getClass().getResource("/assets/food2.png"))); // NOI18N
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
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 330, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnLunchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLunchActionPerformed
loadFoodForMeal("lunch");        // TODO add your handling code here:
    }//GEN-LAST:event_btnLunchActionPerformed

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

    private void jLabel1AncestorAdded(javax.swing.event.AncestorEvent evt) {//GEN-FIRST:event_jLabel1AncestorAdded

// TODO add your handling code here:
    }//GEN-LAST:event_jLabel1AncestorAdded

    private void btnBreakfastActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBreakfastActionPerformed
loadFoodForMeal("breakfast");        // TODO add your handling code here:
    }//GEN-LAST:event_btnBreakfastActionPerformed

    private void btnSnackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSnackActionPerformed
 loadFoodForMeal("snack");        // TODO add your handling code here:
    }//GEN-LAST:event_btnSnackActionPerformed

    private void btnDinnerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDinnerActionPerformed
loadFoodForMeal("dinner");        // TODO add your handling code here:
    }//GEN-LAST:event_btnDinnerActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
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
        //</editor-fold>

        /* Create and display the form */
       
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBreakfast;
    private javax.swing.JButton btnDinner;
    private javax.swing.JButton btnLunch;
    private javax.swing.JButton btnSnack;
    private javax.swing.JButton food;
    private javax.swing.JList<String> foodList;
    private javax.swing.JButton home;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton skin;
    private javax.swing.JButton workout;
    // End of variables declaration//GEN-END:variables
}
