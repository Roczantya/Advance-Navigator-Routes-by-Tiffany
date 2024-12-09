import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  final String birthdayMessage;
  const FirstScreen({super.key, required this.birthdayMessage});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isButtonPressed = false; // Variabel untuk memantau status tombol

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Biodata',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Biodata
            Text(
              'Biodata Saya:',
              style: GoogleFonts.oswald(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Informasi Biodata
            _buildBiodataRow('Nama', 'Tiffany'),
            _buildBiodataRow('Umur', '19 Tahun'),
            _buildBiodataRow('Tanggal Lahir', '1 April 2005'),
            _buildBiodataRow('Jurusan', 'IMT'),

            const SizedBox(height: 20),

            // Menampilkan Pesan Ulang Tahun
            Text(
              widget.birthdayMessage, // Menampilkan pesan ulang tahun
              style: const TextStyle(fontSize: 18, color: Colors.lightGreen),
            ),
            const SizedBox(height: 40),

            // Tombol Ucapkan Selamat Ulang Tahun
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isButtonPressed = true; // Mark the button as pressed
                  });
                  _showBirthdayDialog(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (_isButtonPressed) {
                        return Colors.lightBlueAccent; // Color after pressed
                      }
                      return Colors.white; // Default color
                    },
                  ),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  'Ucapkan Selamat Ulang Tahun',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between the buttons

            // Tombol Go to Next Screen
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  'Go to Next Screen',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan setiap baris biodata
  Widget _buildBiodataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  // Dialog untuk menampilkan pesan ulang tahun
  void _showBirthdayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Icon(
                  Icons.cake,
                  size: 50,
                  color: Colors.brown,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Selamat Ulang Tahun, Tiffany!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tutup'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
