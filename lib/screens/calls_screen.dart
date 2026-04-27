import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/call_tile.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Boutons rapides — hauteur fixe avec SingleChildScrollView
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                _QuickAction(icon: Icons.call, label: 'Appeler'),
                SizedBox(width: 20),
                _QuickAction(icon: Icons.calendar_today, label: 'Planifier'),
                SizedBox(width: 20),
                _QuickAction(icon: Icons.dialpad, label: 'Clavier'),
                SizedBox(width: 20),
                _QuickAction(
                  icon: Icons.group,
                  label: 'Groupe',
                  highlighted: true,
                ),
                SizedBox(width: 20),
                _QuickAction(icon: Icons.favorite_border, label: 'Favoris'),
              ],
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 6),
          child: Text(
            'Récents',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        ...mockCalls.map((call) => CallTile(call: call)),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool highlighted;

  const _QuickAction({
    required this.icon,
    required this.label,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: highlighted
              ? const Color(0xFF6B4FA0)
              : const Color(0xFF2A3942),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
      ],
    );
  }
}