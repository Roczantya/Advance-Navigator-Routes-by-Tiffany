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
            builder: (context) => ScreenPage(
              screenIndex: _screenCount -
                  1, // Mulai dari layar yang sesuai dengan jumlah input
              maxScreens: _screenCount,
            ),
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
        title: const Text('Build`s Screen'),
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
              child: Text('Buat Layar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenPage extends StatefulWidget {
  final int screenIndex;
  final int maxScreens;

  const ScreenPage(
      {super.key, required this.screenIndex, required this.maxScreens});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  late int _screenIndex;
  late int _maxScreens;

  @override
  void initState() {
    super.initState();
    _screenIndex = widget.screenIndex;
    _maxScreens = widget.maxScreens;
  }

  // Menambah layar baru
  void _createNewScreen() {
    setState(() {
      _maxScreens += 1;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenPage(
          screenIndex: _screenIndex + 1,
          maxScreens: _maxScreens,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen ${_screenIndex + 1}'), // Menampilkan nomor layar
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (_screenIndex > 0) {
                Navigator.pop(context); // Kembali ke layar sebelumnya
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah layar ke-${_screenIndex + 1}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _screenIndex == _maxScreens - 1 ? _createNewScreen : null,
              child: Text(_screenIndex == _maxScreens - 1
                  ? 'Buat Layar Baru'
                  : 'Maksimal Layar'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke layar sebelumnya
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
