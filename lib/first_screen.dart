import 'package:flutter/material.dart';
import 'second_screen.dart';

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
        title: const Text('Biodata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Biodata Saya:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nama: Tiffany',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Umur: 19 Tahun',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Tanggal Lahir: 1 April 2005',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Jurusan: IMT',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),
            Text(
              widget
                  .birthdayMessage, // Menampilkan pesan ulang tahun yang diteruskan
              style: const TextStyle(fontSize: 18, color: Colors.lightGreen),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity, // Make button as wide as possible
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
                        return Colors
                            .lightBlueAccent; // Button color after being pressed
                      }
                      return Colors.white; // Default button color
                    },
                  ),
                ),
                child: const Text('Ucapkan Selamat Ulang Tahun'),
              ),
            ),

            const SizedBox(height: 20), // Space between the two buttons

            // Centered button - Go to Next Screen
            SizedBox(
              width: double.infinity, // Make button as wide as possible
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: const Text('Go to next Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
