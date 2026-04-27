import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final Function(String?)? onPlayAudio; // Callback pour jouer le vocal

  const MessageBubble({
    super.key,
    required this.message,
    this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: message.isSent
              ? const Color(0xFF005C4B)
              : const Color(0xFF1F2C34),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: message.isSent
                ? const Radius.circular(12)
                : Radius.zero,
            bottomRight: message.isSent
                ? Radius.zero
                : const Radius.circular(12),
          ),
        ),
        child: message.type == MessageType.audio
            ? _buildAudioBubble()
            : _buildTextBubble(),
      ),
    );
  }

  Widget _buildTextBubble() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(message.text,
            style: const TextStyle(color: Colors.white, fontSize: 15)),
        const SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message.time,
                style: const TextStyle(color: Colors.grey, fontSize: 11)),
            const SizedBox(width: 3),
            if (message.isSent)
              const Icon(Icons.done_all,
                  size: 14, color: Color(0xFF53BDEB)),
          ],
        ),
      ],
    );
  }

  Widget _buildAudioBubble() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Bouton play — appuie pour écouter
        GestureDetector(
          onTap: () => onPlayAudio?.call(message.audioPath),
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF00A884),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow,
                color: Colors.white, size: 22),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(message.audioDuration ?? '0:00',
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 11)),
                  Row(
                    children: [
                      Text(message.time,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 11)),
                      const SizedBox(width: 3),
                      if (message.isSent)
                        const Icon(Icons.done_all,
                            size: 14, color: Color(0xFF53BDEB)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}