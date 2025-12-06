# GlowMax - Health & Skincare Tracking Application

## 📸 Preview Aplikasi

### Halaman Animation Intro Aplikasi
![Intro Animation](Preview%20Glowmax/Intro-animation.png)

### Main Dashboard & Result BMI Calculation
![Main Dashboard](Preview%20Glowmax/Main.png)
![BMI Result](Preview%20Glowmax/Result-BMI.png)

### Rekomendasi Workout
![Workout Plan](Preview%20Glowmax/Workout.png)

### Rekomendasi Diet & Kalori
![Diet Recommendation](Preview%20Glowmax/Diet.png)

### Rekomendasi Skincare
![Skincare Routine](Preview%20Glowmax/Skincare.png)

---

## 📋 Daftar Isi
- [Tim Pengembang](#tim-pengembang)
- [Tentang Project](#tentang-project)
- [Fitur Utama](#fitur-utama)
- [Konsep OOP yang Digunakan](#konsep-oop-yang-digunakan)
- [Tech Stack](#tech-stack)
- [Penggunaan Aplikasi](#penggunaan-aplikasi)



## 👥 Tim Pengembang

|            Nama           |      NPM      |
|---------------------------|---------------|
| **Syahid Ahmad Yasin**    | 2410631170170 |
| **Nazril Adrian**         | 2410631170097 | 
| **Rafli Rizki Fadillah**  | 2410631170099 |
| **Muhammad Rizky Rajabi** | 2410631170039 | 

---

## 🎯 Tentang Project

**GlowMax** adalah aplikasi desktop berbasis Java yang dirancang untuk membantu pengguna meningkatkan kesehatan dan penampilan fisik secara holistik. Aplikasi ini menggabungkan fitur tracking berat badan, perhitungan BMI, rekomendasi diet, panduan olahraga, dan tips perawatan kulit yang dipersonalisasi.

### Latar Belakang
- 35.5% orang berolahraga untuk memperbaiki bentuk tubuh
- 31.1% ketidakpuasan tubuh dipengaruhi perbandingan fisik dengan orang lain
- 89% menganggap penampilan fisik sangat penting di era modern

GlowMax hadir sebagai solusi untuk memberikan panduan, rekomendasi sehat, dan tracking progres secara teratur.

---

## ✨ Fitur Utama

### 1. **BMI Calculation** 
- Menghitung Body Mass Index berdasarkan tinggi & berat badan
- Memberikan kategori kesehatan (Underweight, Normal, Overweight, Obese)

### 2. **Personalized Workout Planner**
- Rekomendasi olahraga berdasarkan BMI dan preferensi tempat (Gym, Home with Equipment, Home No Equipment)
- Jadwal mingguan (Senin-Minggu)

### 3. **Daily Calorie Tracking**
- Target kalori yang disesuaikan dengan BMI
- Breakdown makanan: Breakfast, Lunch, Snack, Dinner
- Rekomendasi menu sehat

### 4. **Personalized Skincare Routine**
- Didasarkan pada tipe kulit (Normal, Oily, Dry, Combination, Sensitive)
- Rekomendasi produk skincare (Face Wash, Toner, Serum)
- Dua pilihan budget: Low Budget & Premium

### 5. **Daily Quest & Routine**
- Daily tasks untuk motivasi dan habit formation
- Checklist tracking progress
- Sistem reward visual

### 6. **Glow Summary & Statistics**
- Ringkasan kondisi kesehatan pengguna
- Progress tracking harian
- Insight berkala

---

## 🏗️ Konsep OOP yang Digunakan

### 1. **Encapsulation (Enkapsulasi)**
Setiap class menyimpan data dan method yang terkait, dengan akses modifier yang tepat (private, public).

**Contoh:**
class User {
private String gender;
private int age;
private double height;
private double weight;

public void setGender(String gender) { this.gender = gender; }
public String getGender() { return gender; }
}

### 2. **Inheritance (Pewarisan)**
Beberapa class mewarisi dari base class untuk memaksimalkan reusability.

**Contoh:**
class Recommendation extends BaseFrame {
// Mewarisi method dari BaseFrame
}

### 3. **Polymorphism (Polimorfisme)**
Method dengan nama sama tapi perilaku berbeda tergantung context (overriding, overloading).

**Contoh:**
// Overriding method dari parent class
@Override
public void displayRecommendation() { }

### 4. **Abstraction (Abstraksi)**
Menyembunyikan kompleksitas implementasi, hanya menampilkan interface yang penting.

**Contoh:**
interface IRecommendation {
void getRecommendation(int bmiCategory);
}

### 5. **ArrayList & Collections**
Penggunaan `ArrayList` untuk menyimpan koleksi data (workout list, meal list, skincare products).

**Contoh:**
ArrayList<WorkoutItem> workouts = new ArrayList<>();

---

## 💻 Tech Stack
_________________________________________________________________________
| Komponen                  | Teknologi                                 |
|---------------------------|-------------------------------------------|
| **Bahasa Pemrograman**    | Java 11+                                  |
| **IDE**                   | Apache NetBeans / IntelliJ IDEA           |
| **GUI Framework**         | Java Swing (JFrame, JPanel, JButton, dll) |
| **Database**              | MySQL 8.0+                                |
| **Database Management**   | phpMyAdmin                                |
| **Database Driver**       | JDBC Connector                            |
| **Arsitektur**            | Object-Oriented Programming (OOP)         |
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

## 📱 Penggunaan Aplikasi

### Alur Penggunaan

1. **Login / Registrasi**   → Sistem membuat user baru di database
2. **Input Data Diri**      → Gender, Usia, Tinggi, Berat Badan
3. **Pilih Preferensi**     → Tipe Kulit, Tempat Olahraga, Budget Level
4. **Lihat BMI & Summary**  → Sistem menampilkan analisis awal
5. **Dapatkan Rekomendasi** → Workout, Diet, Skincare
6. **Track Daily Quest**    → Jalankan daily routine untuk motivasi
7. **Monitor Statistik**    → Lihat progress kesehatan

✨ *Keep Grow and Glow, stay Healthy!* ✨

