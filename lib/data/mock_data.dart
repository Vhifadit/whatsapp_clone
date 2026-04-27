// On importe les modèles qu'on vient de créer
import '../models/chat.dart';
import '../models/message.dart';
import '../models/status.dart';
import '../models/call.dart';

// ===== LISTE DES CONVERSATIONS =====
final List<Chat> mockChats = [
  Chat(
    id: '1',
    contactName: 'MAMAN Chérie',
    lastMessage: 'Message vocal (0:03)',
    time: 'Hier',
    unreadCount: 0,
  ),
  Chat(
    id: '2',
    contactName: 'Vhiban Hosnie',
    lastMessage: 'Ok d\'accord',
    time: '14:07',
    unreadCount: 1,
  ),
  Chat(
    id: '3',
    contactName: 'Papa',
    lastMessage: 'J\'aimerais vous demander...',
    time: '14:05',
    unreadCount: 0,
  ),
  Chat(
    id: '4',
    contactName: 'Sabi',
    lastMessage: 'Vous avez réagi par ❤️',
    time: '13:47',
    unreadCount: 0,
  ),
  Chat(
    id: '5',
    contactName: 'Hamizath',
    lastMessage: 'c\'est mtn je commence',
    time: '13:40',
    unreadCount: 0,
  ),
  Chat(
    id: '6',
    contactName: 'Gs Irène',
    lastMessage: 'Vous avez réagi par ❤️',
    time: '13:38',
    unreadCount: 0,
  ),
  Chat(
    id: '7',
    contactName: 'Ashley',
    lastMessage: 'Ok merci !',
    time: '13:20',
    unreadCount: 0,
  ),
];

// ===== MESSAGES D'UNE CONVERSATION =====
final List<Message> mockMessages = [
  Message(id: '1', text: 'D\'accord maman', isSent: true, time: '12:11'),
  Message(id: '2', text: 'Non non comme il dit il te connaît la', isSent: true, time: '12:11'),
  Message(id: '3', text: 'Et il prend 700', isSent: true, time: '12:11'),
  Message(id: '4', text: 'Oui oui', isSent: true, time: '12:16'),
  Message(id: '5', text: 'Merci beaucoup maman 🙏', isSent: true, time: '12:56'),
  Message(id: '6', text: 'J\'ai reçu 👍', isSent: true, time: '12:56'),
  Message(id: '7', text: 'D\'accord maman', isSent: true, time: '14:44'),
  Message(id: '8', text: 'Suis ravie.', isSent: true, time: '14:44'),
];

// ===== STATUTS / ACTUS =====
final List<Status> mockStatuses = [
  Status(contactName: 'Moi', time: 'Ajouter à mon statut', isMyStatus: true),
  Status(contactName: 'Real Madrid C.F.', time: '14:00'),
  Status(contactName: 'H2bet', time: '13:05'),
  Status(contactName: 'ZEYROX', time: '11:38'),
  Status(contactName: 'Web Development', time: '10:57'),
  Status(contactName: 'King Pronos', time: '01:12'),
];

// ===== APPELS =====
final List<Call> mockCalls = [
  Call(
    contactName: 'Fernande',
    isVideo: false,
    isMissed: false,
    isIncoming: false,
    dateTime: 'Aujourd\'hui, 03:20',
  ),
  Call(
    contactName: 'Sabi',
    isVideo: false,
    isMissed: true,
    isIncoming: true,
    dateTime: 'Hier, 23:50',
  ),
  Call(
    contactName: 'Vhiban Hosnie',
    isVideo: false,
    isMissed: false,
    isIncoming: false,
    dateTime: 'Hier, 20:13',
  ),
  Call(
    contactName: 'Fernande',
    isVideo: false,
    isMissed: true,
    isIncoming: true,
    dateTime: 'Hier, 18:16',
  ),
  Call(
    contactName: 'Vhiban Hosnie',
    isVideo: false,
    isMissed: true,
    isIncoming: true,
    dateTime: 'Hier, 14:52',
  ),
  Call(
    contactName: 'Joanita',
    isVideo: false,
    isMissed: false,
    isIncoming: false,
    dateTime: '24 avril, 12:55',
  ),
];