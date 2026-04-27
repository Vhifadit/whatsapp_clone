import 'package:flutter/material.dart';
import '../data/mock_data.dart';

// L'écran Actus (statuts + chaînes)
class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final channels = mockStatuses.where((s) => !s.isMyStatus).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Titre Statut
        const Text(
          'Statut',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // Cartes Mon statut + Masqué
        Row(
          children: [
            _StatusCard(label: 'Mon statut', hasPlus: true),
            const SizedBox(width: 10),
            _StatusCard(label: 'Masqué', isHidden: true),
          ],
        ),

        const SizedBox(height: 12),

        // Bouton Booster le statut
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF2A3942)),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bolt, color: Color(0xFF00A884), size: 18),
              SizedBox(width: 6),
              Text(
                'Booster le statut',
                style: TextStyle(
                  color: Color(0xFF00A884),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Titre Chaînes + bouton Explorer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Chaînes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2A3942),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Explorer',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Liste des chaînes
        ...channels.map((s) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[800],
                child: Text(
                  s.contactName[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                s.contactName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                s.time,
                style:
                    const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0xFF2A3942),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '9',
                  style:
                      TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            )),
      ],
    );
  }
}

// Carte statut (Mon statut / Masqué)
class _StatusCard extends StatelessWidget {
  final String label;
  final bool hasPlus;
  final bool isHidden;

  const _StatusCard({
    required this.label,
    this.hasPlus = false,
    this.isHidden = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFF1F2C34),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xFF2A3942),
              child: isHidden
                  ? const Icon(Icons.visibility_off,
                      color: Colors.grey, size: 26)
                  : const Icon(Icons.add,
                      color: Color(0xFF00A884), size: 26),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}