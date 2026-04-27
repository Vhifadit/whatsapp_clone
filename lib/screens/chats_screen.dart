import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/chat_tile.dart';
import 'chat_detail_screen.dart';

// L'écran qui affiche la liste de toutes les conversations
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barre de recherche
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Rechercher...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFF2A3942),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),

        // Filtres : Toutes / Favoris / Groupes
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              _FilterChip(label: 'Toutes', selected: true),
              _FilterChip(label: 'Favoris', selected: false),
              _FilterChip(label: 'Groupes 2', selected: false),
            ],
          ),
        ),

        const SizedBox(height: 6),

        // Liste des conversations
        Expanded(
          child: ListView(
            children: [
              // Ligne Archivées
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A3942),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.archive_outlined,
                    color: Color(0xFF00A884),
                  ),
                ),
                title: const Text(
                  'Archivées',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                trailing: const Text(
                  '2',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),

              const Divider(color: Colors.white10, height: 1),

              // Toutes les conversations
              ...mockChats.map((chat) => ChatTile(
                    chat: chat,
                    onTap: () {
                      // Quand on appuie : ouvre la conversation
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatDetailScreen(chat: chat),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

// Petit bouton filtre (Toutes, Favoris, etc.)
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFF00A884)
            : const Color(0xFF2A3942),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey,
          fontSize: 13,
          fontWeight:
              selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}