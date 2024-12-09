import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'first_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Codelab',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        } else if (settings.name == '/biodata') {
          final args = settings.arguments as Map;
          return MaterialPageRoute(
            builder: (context) =>
                FirstScreen(birthdayMessage: args['birthdayMessage']),
          );
        } else if (settings.name == '/inputbox') {
          return MaterialPageRoute(builder: (context) => SecondScreen());
        }
        return null;
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for Bottom Navigation Bar
  final List<Widget> _pages = [
    const HomePage(),
    SecondScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Generated Screen'),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateTime _birthDate =
      DateTime(2005, 4, 1); // Tanggal lahir yang sudah diatur
  String _birthdayMessage = ''; // Variabel untuk menyimpan hasil perhitungan

  void _calculateDaysUntilBirthday() {
    final now = DateTime.now();
    DateTime nextBirthday = DateTime(
      now.year,
      _birthDate.month,
      _birthDate.day,
    ).toLocal();

    if (nextBirthday.isBefore(now)) {
      nextBirthday = DateTime(
        now.year + 1,
        _birthDate.month,
        _birthDate.day,
      );
    }

    final daysUntilBirthday = nextBirthday.difference(now).inDays;

    setState(() {
      _birthdayMessage = 'Ulang tahunmu lagi $daysUntilBirthday hari lagi!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('images/bg.jpeg'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Menyesuaikan gambar ke layar
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the Home Page',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _calculateDaysUntilBirthday(); // Hitung hari ulang tahun sebelum navigasi

                  // Navigate to FirstScreen
                  Navigator.pushNamed(
                    context,
                    '/biodata',
                    arguments: {'birthdayMessage': _birthdayMessage},
                  );
                },
                child: const Text('Go to First Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: const Center(
        child: Text('This is the Search Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: Text('This is the Profile Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: const Center(
        child:
            Text('This is the Settings Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
