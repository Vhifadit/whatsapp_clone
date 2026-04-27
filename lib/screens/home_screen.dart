import 'package:flutter/material.dart';
import 'chats_screen.dart';
import 'calls_screen.dart';
import 'status_screen.dart';

// L'écran principal avec la navigation en bas
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Onglet actif

  final List<Widget> _screens = const [
    ChatsScreen(),
    CallsScreen(),
    StatusScreen(),
  ];

  final List<String> _titles = ['WhatsApp', 'Appels', 'Actus'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2C34),
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined,
                color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],

      // Barre de navigation en bas
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF1F2C34),
        selectedItemColor: const Color(0xFF00A884),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Appels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_large_outlined),
            label: 'Actus',
          ),
        ],
      ),

      // Bouton + en bas à droite
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        onPressed: () {},
        child: const Icon(Icons.add_comment_outlined,
            color: Colors.white),
      ),
    );
  }
}