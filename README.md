GlowMax - Health & Skincare Tracking Application

## 📋 Daftar Isi
- [Tim Pengembang](#tim-pengembang)
- [Tentang Project](#tentang-project)
- [Preview Aplikasi](#preview-aplikasi)
- [Fitur Utama](#fitur-utama)
- [Konsep OOP yang Digunakan](#konsep-oop-yang-digunakan)
- [Tech Stack](#tech-stack)
- [Penggunaan Aplikasi](#penggunaan-aplikasi)

---

## 👥 Tim Pengembang

|            Nama           |      NPM      |
|---------------------------|---------------|
| **Muhammad Rizky Rajabi** | 2410631170039 |
| **Nazril Adrian**         | 2410631170097 | 
| **Rafli Rizki Fadillah**  | 2410631170099 |
| **Syahid Ahmad Yasin**    | 2410631170170 | 

---  

## 🎯 Tentang Project

**GlowMax** adalah aplikasi desktop berbasis Java yang dirancang untuk membantu pengguna meningkatkan kesehatan dan penampilan fisik secara holistik. Aplikasi ini menggabungkan fitur tracking berat badan, perhitungan BMI, rekomendasi diet, panduan olahraga, dan tips perawatan kulit yang dipersonalisasi.

### Latar Belakang
- 35.5% orang berolahraga untuk memperbaiki bentuk tubuh
- 31.1% ketidakpuasan tubuh dipengaruhi perbandingan fisik dengan orang lain
- 89% menganggap penampilan fisik sangat penting di era modern

GlowMax hadir sebagai solusi untuk memberikan panduan, rekomendasi sehat, dan tracking progres secara teratur.

---

## 📸 Preview Aplikasi

### Halaman Animation Intro Aplikasi
![Intro Animation](GlowMaxApp/Preview%20Glowmax/Intro-animation.png)

---

### Dashboard Utama
![Main Dashboard](GlowMaxApp/Preview%20Glowmax/Main.png)

---

### Perhitungan BMI
![BMI Result](GlowMaxApp/Preview%20Glowmax/Result-BMI.png)

---

### Rekomendasi Workout
![Workout Plan](GlowMaxApp/Preview%20Glowmax/Workout.png)

---

### Rekomendasi Diet & Kalori
![Diet Recommendation](GlowMaxApp/Preview%20Glowmax/Diet.png)

---

### Rekomendasi Skincare
![Skincare Routine](GlowMaxApp/Preview%20Glowmax/Skincare.png)

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
Data user (seperti berat, tinggi, gender) dibungkus dalam class dengan access modifier private dan diakses via method setter/getter, menjaga data integrity.

**Contoh:**
private String gender;
private int age;
private double height;
private double weight;

public void setGender(String gender) { this.gender = gender; }
public String getGender() { return gender; }


### 2. **Inheritance (Pewarisan)**
Penggunaan pewarisan pada struktur UI dan komponen untuk mengurangi duplikasi kode. Diterapkan pada FadePanel extends JPanel untuk custom animation.

**Contoh:**
class Recommendation extends BaseFrame {
// Mewarisi method dari BaseFrame
}

### 3. **Polymorphism (Polimorfisme)**
Implementasi method yang dinamis untuk berbagai jenis rekomendasi. Method dengan nama sama tapi perilaku berbeda tergantung context (overriding).

**Contoh:**
// Overriding method dari parent class
@Override
public void displayRecommendation() { }

### 4. **Abstraction (Abstraksi)**
Penggunaan class abstrak dan interface untuk template dasar fitur-fitur aplikasi, menyembunyikan kompleksitas implementasi.

**Contoh:**
interface IRecommendation {
void getRecommendation(int bmiCategory);
}

### 5. **ArrayList**
Penggunaan ArrayList untuk menyimpan koleksi data (workout list, meal list, skincare products, daily tasks).

**Contoh:**
ArrayList<WorkoutItem> workouts = new ArrayList<>();

---

## 💻 Tech Stack

| Komponen                  | Teknologi                                 |
|---------------------------|-------------------------------------------|
| **Bahasa Pemrograman**    | Java 11+                                  |
| **IDE**                   | Apache NetBeans / IntelliJ IDEA           |
| **GUI Framework**         | Java Swing (JFrame, JPanel, JButton, dll) |
| **Database**              | MySQL 8.0+                                |
| **Database Management**   | phpMyAdmin                                |
| **Database Driver**       | JDBC Connector                            |
| **Arsitektur**            | Object-Oriented Programming (OOP)         |

---

## 📱 Penggunaan Aplikasi
### Alur Penggunaan

#### 1️⃣ Launch Aplikasi
Jalankan aplikasi dari NetBeans, IntelliJ IDEA, atau file JAR yang sudah di-build. 

#### 2️⃣ Input Data Diri (Sequential UI - 7 Tahap)
Pengguna harus mengisi data diri secara berurutan. Setiap input langsung disimpan ke database sebelum lanjut ke tahap berikutnya:

| Tahap | Input     | Pilihan                                       | Database Field          |
|-------|-----------|-----------------------------------------------|-------------------------|
| 1     | Gender    | Male / Female                                 | gender                  |
| 2     | Age       | 15-19 years / 20-29 years / 30+ years         | age                     |
| 3     | Body      | Tinggi (cm) & Berat Badan (kg)                | height_cm, weight_kg    |
| 4     | Skin Type | Normal / Oily / Dry / Combination / Sensitive | skin_type               |
| 5     | Exercise  | Home / Equipment / Gym                        | exercise_type           |
| 6     | Budget    | Low Budget / High Budget (Premium)            | budget_level            |
| 7     | BMI       | Auto-calculated berdasarkan tinggi & berat    | bmi_value, bmi_category |

**Output BMI Calculation:**
|Kategori Berat Badan     | BMI Value    | Rekomendasi                                                       |
|-------------------------|--------------|-------------------------------------------------------------------|
|Underweight              | < 18.5       | ↑ Tingkatkan kalori & nutrisi                                     |
|Normal / Ideal           | 18.5 - 24.9  | ✓ Pertahankan pola sehat                                          |
|Overweight               | 25 - 29.9    | ↓ Mulai diet & olahraga rutin                                     |
|Obese                    | ≥ 30         | ↓ Mulai diet & olahraga rutin dengan intensitas yang spesial/lebih|

#### 3️⃣ Akses Dashboard Utama

Setelah BMI calculation selesai, user masuk ke **Dashboard Utama** yang menampilkan:

**📊 Glow Summary**
- Status kesehatan saat ini berdasarkan BMI
- Rekomendasi awal disesuaikan dengan kategori BMI
- Preview statistik progress

**🧭 Navigation Bar (Bottom)**
4 icon navigasi untuk akses modul-modul utama:

[🏠 Home] [💪 Workout] [🍽️ Calories] [💅 Skincare]

#### 4️⃣ Gunakan Fitur Rekomendasi

Dari dashboard, user bisa explore 4 module rekomendasi utama:

**💪 Workout Module - Rekomendasi Program Olahraga**

Rekomendasi disesuaikan dengan 2 faktor utama:

| BMI Status | Exercise Type | Program Rekomendasi |
|-----------|---------------|-------------------|
| Underweight | Home | Bodyweight + Nutrition focus |
| Underweight | Equipment | Light resistance training |
| Underweight | Gym | Full facilities + bulking program |
| Normal | Home | Maintenance bodyweight exercises |
| Normal | Equipment | Moderate intensity training |
| Normal | Gym | Balanced strength & cardio |
| Overweight | Home | High-intensity bodyweight |
| Overweight | Equipment | Cardio + resistance combo |
| Overweight | Gym | Treadmill + strength training |
| Obese | Home | Low-impact, gradual intensity |
| Obese | Equipment | Beginner-friendly, supervised |
| Obese | Gym | Professional guidance recommended |

Setiap rekomendasi ditampilkan dengan:
- Nama latihan 
- Jadwal mingguan (Senin - Minggu)
- Estimasi durasi per sesi

---

**🥗 Calories Module - Rekomendasi Diet & Meal Plan**

Daily calorie goal dihitung otomatis berdasarkan BMI + breakfast breakdown untuk maksimal 4 meal times:

| BMI Category | Daily Target Calories | Focus | Meal Breakdown |
|-------------|----------------------|-------|---------------|
| Underweight | 2500-3000 kcal | Penambahan berat | +500kcal surplus |
| Normal | 2000-2200 kcal | Maintenance | Balanced intake |
| Overweight | 1500-1800 kcal | Penurunan berat | -500kcal deficit |
| Obese | 1200-1500 kcal | Significant deficit | Strict intake |

Setiap meal terbagi jadi 4 kategori:
1. **Breakfast** (Sarapan)
2. **Lunch** (Makan Siang)
3. **Snack** (Cemilan)
4. **Dinner** (Makan Malam)

---

**💅 Skincare Module - Rekomendasi Skincare Routine**

3-step morning skincare routine yang dipersonalisasi berdasarkan **Skin Type** dan **Budget Level**:

Setiap skincare routine terbagi jadi 3 kategori produk:
1. **Face Wash** (Pembersih Wajah)
2. **Toner** (Penyeimbang pH & Hydration)
3. **Serum** (Perawatan Intensif)

Rekomendasi produk disesuaikan dengan:
- **Jenis Kulit:** Normal / Oily / Dry / Combination / Sensitive
- **Budget Level:** Low Budget atau Premium/High Budget

---

### Alur Penggunaan Secara Ringkas
1. **Login / Registrasi**   → Sistem membuat user baru di database
2. **Input Data Diri**      → Gender, Usia, Tinggi, Berat Badan
3. **Pilih Preferensi**     → Tipe Kulit, Tempat Olahraga, Budget Level
4. **Lihat BMI & Summary**  → Sistem menampilkan analisis awal
5. **Dapatkan Rekomendasi** → Workout, Diet, Skincare
6. **Track Daily Quest**    → Jalankan daily routine untuk motivasi
7. **Monitor Statistik**    → Lihat progress kesehatan

✨ *Keep Grow and Glow, stay Healthy!* ✨

---
