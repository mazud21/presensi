import 'package:flutter/material.dart';
import 'package:presensi/model_presensi.dart';
import 'package:presensi/presensi_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatPresensiPage extends StatefulWidget {
  const RiwayatPresensiPage({super.key});

  @override
  State<RiwayatPresensiPage> createState() => _RiwayatPresensiPageState();
}

class _RiwayatPresensiPageState extends State<RiwayatPresensiPage> {
  final _service = PresensiService();
  late Future<List<ModelPresensi>> _future;

  @override
  void initState() {
    super.initState();
    _future = _service.fetchPresensi();
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    if (!mounted) return;
    // Hapus semua halaman sebelumnya & kembali ke login
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Presensi'),
        actions: [
          IconButton(onPressed: () => _logout(), icon: Icon(Icons.logout))],
      ),
      body: FutureBuilder<List<ModelPresensi>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final presensiList = snapshot.data ?? [];
          if (presensiList.isEmpty) {
            return const Center(child: Text('Belum ada data.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: presensiList.length,
            itemBuilder: (context, i) {
              final p = presensiList[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(p.studentName),
                  subtitle: Text(p.date),
                ),
              );
            },
          );
        },
      ),
    );
  }
}