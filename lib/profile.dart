import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Data contoh; di proyek riil sebaiknya diisi dari API atau state‑management
  final String name;
  final String email;

  const ProfilePage({
    super.key,
    this.name = 'Nama Pengguna',
    this.email = 'email@example.com',
  });

  // Fungsi logout
  void _logout(BuildContext context) {
    // TODO: Bersihkan token / SharedPreferences / state di sini

    // Contoh navigasi: kembali ke halaman login & hapus semua rute sebelumnya
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 48,
                child: Icon(Icons.person, size: 48),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _logout(context),
                  icon: const Icon(Icons.logout),
                  label: const Text('LOGOUT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
