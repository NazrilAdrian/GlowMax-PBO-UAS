/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.awt.AlphaComposite;
import java.awt.Graphics;
import java.awt.Graphics2D;
import javax.swing.JPanel;
/**
 *
 * @author Acer
 */
public class FadePanel extends JPanel {

    private float opacity = 1.0f;

    public FadePanel() {
        setOpaque(false);
    }

    public void setOpacity(float opacity) {
        this.opacity = opacity;
        repaint();
    }

    public float getOpacityValue() {
        return opacity;
    }

    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2 = (Graphics2D) g.create();
        g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, opacity));
        super.paintComponent(g2);
        g2.dispose();
    }
}
