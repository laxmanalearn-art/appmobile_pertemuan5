import 'package:flutter/material.dart'; //1

void main() {
  runApp(const MainApp()); //2
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); //3

  final String userName = 'Bayu Laksmana';
  final String role = 'Mahasiswa';
  final String nim = '1124160070';
  final String kelas = 'TI 24 SE SH';

  final List<String> experiences = const [
    //9
    'FrontLiner/Crew Store - PT Niceso Sukses Indonesia',
    'Werehouse Staff - PT Sagara Marjan Lestari',
    'Production Operator - PT Paragon Technology Indonesia', //4
    'College Student - Global Institute Technology and Business',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Profil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profil Pengguna'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 100, 33, 243),
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              const SizedBox(height: 16), //5

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
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'NIM : ' + nim,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Kelas : ' + kelas,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 24),

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

              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const StatItem(count: '15', label: 'Proyek'),

                    const SizedBox(width: 24), //6

                    const StatItem(count: '1.2K', label: 'Followers'),
                    const SizedBox(width: 24),

                    StatItem(count: '42', label: 'Following'), //7
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pengalaman Kerja',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: experiences.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: const Icon(
                          Icons.work,
                          color: Colors.blueAccent,
                        ),
                        title: Text(experiences[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
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
