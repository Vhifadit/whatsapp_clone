import 'package:flutter/material.dart';
import '../models/call.dart';

// Une ligne d'appel dans la liste
class CallTile extends StatelessWidget {
  final Call call;

  const CallTile({super.key, required this.call});

  Color _avatarColor(String name) {
    final colors = [
      Colors.teal, Colors.blue, Colors.purple,
      Colors.orange, Colors.pink,
    ];
    return colors[name.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    // Rouge si manqué, vert si normal
    final Color arrowColor =
        call.isMissed ? Colors.red : const Color(0xFF00A884);

    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: _avatarColor(call.contactName),
            child: Text(
              call.contactName[0].toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          // Nom en rouge si appel manqué
          title: Text(
            call.contactName,
            style: TextStyle(
              color: call.isMissed ? Colors.red : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Flèche + date
          subtitle: Row(
            children: [
              Icon(
                call.isIncoming ? Icons.call_received : Icons.call_made,
                size: 14,
                color: arrowColor,
              ),
              const SizedBox(width: 4),
              Text(
                call.dateTime,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),

          // Icône téléphone pour rappeler
          trailing: Icon(
            call.isVideo ? Icons.videocam : Icons.call,
            color: Colors.grey,
            size: 24,
          ),
        ),
        const Divider(color: Colors.white10, height: 1, indent: 80),
      ],
    );
  }
}