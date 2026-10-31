import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String userName = 'Bayu Laksmana';
  final String role = 'Mahasiswa';
  final String nim = '1124160070';
  final String kelas = 'TI 24 SE SH';

  final List<String> experiences = const [
    'FrontLiner/Crew Store - PT Niceso Sukses Indonesia',
    'Werehouse Staff - PT Sagara Marjan Lestari',
    'Production Operator - PT Paragon Technology Indonesia',
    'College Student - Global Institute Technology and Business',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Profil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 65, 27, 168),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profil Pengguna'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 100, 33, 243),
          foregroundColor: Colors.white,
        ),

        // Seluruh halaman sekarang berada dalam area scroll.
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. Foto profil
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 100, 33, 243),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              const SizedBox(height: 16),

              Column(
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    role,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    'NIM : $nim',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    'Kelas : $kelas',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 3. Tombol edit profil
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fitur edit belum aktif pada modul statis.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
              ),

              const SizedBox(height: 24),

              // 4. Statistik profil
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatItem(count: '15', label: 'Proyek'),
                    StatItem(count: '1.2K', label: 'Followers'),
                    StatItem(count: '42', label: 'Following'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 5. Judul pengalaman kerja
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pengalaman Kerja',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const Divider(),

              // 6. Daftar pengalaman kerja
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.work, color: Colors.blueAccent),
                      title: Text(experiences[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable widget untuk statistik profil.
class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
