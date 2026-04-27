// Un "Status" représente une ligne dans l'écran Actus
class Status {
  final String contactName;
  final String time;
  final bool isMyStatus; // true = c'est mon propre statut

  Status({
    required this.contactName,
    required this.time,
    this.isMyStatus = false,
  });
}