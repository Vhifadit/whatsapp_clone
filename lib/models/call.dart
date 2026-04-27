// Un "Call" représente un appel dans la liste
class Call {
  final String contactName;
  final bool isVideo;      // true = vidéo, false = audio
  final bool isMissed;     // true = appel manqué (rouge)
  final bool isIncoming;   // true = entrant, false = sortant
  final String dateTime;   // Date et heure

  Call({
    required this.contactName,
    required this.isVideo,
    required this.isMissed,
    required this.isIncoming,
    required this.dateTime,
  });
}