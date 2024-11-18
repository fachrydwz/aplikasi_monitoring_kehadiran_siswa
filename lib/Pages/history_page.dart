import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: provider.attendanceRecords.isEmpty
          // Jika attendanceRecords kosong, tampilkan pesan
          ? Center(
              child: Text(
                'Riwayat kosong, mohon absen terlebih dahulu',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          // Jika tidak kosong, tampilkan list view seperti biasa
          : ListView.builder(
              itemCount: provider.attendanceRecords.length,
              itemBuilder: (context, index) {
                final record = provider.attendanceRecords[index];
                return ListTile(
                  title: Text(
                    '${record.date.toLocal()}'.split(' ')[0],
                  ),
                  subtitle: Text(
                    'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
                  ),
                );
              },
            ),
    );
  }
}
