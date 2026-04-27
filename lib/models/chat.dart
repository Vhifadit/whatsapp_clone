// Un "Chat" représente une conversation dans la liste
class Chat {
  final String id;
  final String contactName; // Nom affiché
  final String lastMessage; // Dernier message visible
  final String time;        // Heure du dernier message
  final int unreadCount;    // Nombre de messages non lus (badge vert)

  Chat({
    required this.id,
    required this.contactName,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
  });
}