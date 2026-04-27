enum MessageType { text, audio }

class Message {
  final String id;
  final String text;
  final bool isSent;
  final String time;
  final MessageType type;
  final String? audioDuration;
  final String? audioPath; // Chemin du fichier audio sur l'appareil

  Message({
    required this.id,
    required this.text,
    required this.isSent,
    required this.time,
    this.type = MessageType.text,
    this.audioDuration,
    this.audioPath,
  });
}