import 'package:flutter/material.dart';
import '../models/chat.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatTile({super.key, required this.chat, required this.onTap});

  Color _avatarColor(String name) {
    final colors = [
      Colors.teal, Colors.blue, Colors.purple,
      Colors.orange, Colors.pink, Colors.green,
    ];
    return colors[name.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: _avatarColor(chat.contactName),
            child: Text(
              chat.contactName[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            chat.contactName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            chat.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          // Fix overflow : on utilise IntrinsicHeight
          trailing: SizedBox(
            width: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: chat.unreadCount > 0
                        ? const Color(0xFF00A884)
                        : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                if (chat.unreadCount > 0)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A884),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${chat.unreadCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          onTap: onTap,
        ),
        const Divider(color: Colors.white10, height: 1, indent: 80),
      ],
    );
  }
}