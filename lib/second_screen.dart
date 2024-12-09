import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SecondScreen()));

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _controller = TextEditingController();
  int _screenCount = 0;

  // Fungsi untuk memulai layar sesuai inputan jumlah layar
  void _createScreens() {
    try {
      setState(() {
        _screenCount = int.tryParse(_controller.text) ?? 0;
        if (_screenCount <= 0) {
          throw FormatException(
              "Jumlah layar tidak valid. Harus lebih besar dari 0.");
        }
      });

      if (_screenCount > 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenListPage(maxScreens: _screenCount),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Generated Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah layar yang ingin dibuat (max: 10)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createScreens,
              child: const Text('Buat Layar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenListPage extends StatelessWidget {
  final int maxScreens;

  const ScreenListPage({super.key, required this.maxScreens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Layar'),
      ),
      body: ListView.builder(
        itemCount: maxScreens,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Layar ke-${index + 1}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenPage(screenIndex: index, maxScreens: maxScreens),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ScreenPage extends StatelessWidget {
  final int screenIndex;
  final int maxScreens;

  const ScreenPage(
      {super.key, required this.screenIndex, required this.maxScreens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen ${screenIndex + 1}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah layar ke-${screenIndex + 1}'),
            const SizedBox(height: 20),
            if (screenIndex < maxScreens - 1)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenPage(
                        screenIndex: screenIndex + 1,
                        maxScreens: maxScreens,
                      ),
                    ),
                  );
                },
                child: const Text('Layar Berikutnya'),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke layar sebelumnya
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
