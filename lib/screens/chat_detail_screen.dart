import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/chat.dart';
import '../models/message.dart';
import '../data/mock_data.dart';
import '../widgets/message_bubble.dart';

class ChatDetailScreen extends StatefulWidget {
  final Chat chat;
  const ChatDetailScreen({super.key, required this.chat});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = List.from(mockMessages);
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _hasText = false;
  bool _isRecording = false;
  int _recordSeconds = 0;
  dynamic _recordTimer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  // Envoyer un message texte
  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(Message(
        id: DateTime.now().toString(),
        text: text,
        isSent: true,
        time: _currentTime(),
        type: MessageType.text,
      ));
    });
    _controller.clear();
    _scrollToBottom();
  }

  // Démarrer la simulation d'enregistrement
  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordSeconds = 0;
    });
    // Compteur de secondes
    _recordTimer = Stream.periodic(
      const Duration(seconds: 1),
    ).listen((_) {
      setState(() => _recordSeconds++);
    });
  }

  // Arrêter et envoyer le vocal simulé
  void _stopAndSendAudio() {
    _recordTimer?.cancel();
    final duration = _formatDuration(_recordSeconds);
    setState(() {
      _isRecording = false;
      _messages.add(Message(
        id: DateTime.now().toString(),
        text: 'Message vocal',
        isSent: true,
        time: _currentTime(),
        type: MessageType.audio,
        audioDuration: duration,
      ));
      _recordSeconds = 0;
    });
    _scrollToBottom();
  }

  // Annuler l'enregistrement
  void _cancelRecording() {
    _recordTimer?.cancel();
    setState(() {
      _isRecording = false;
      _recordSeconds = 0;
    });
  }

  // Jouer un audio (simulé — affiche juste un message)
  void _playAudio(String? path) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🎵 Lecture du message vocal...'),
        backgroundColor: Color(0xFF1F2C34),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _formatDuration(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  String _currentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Color _avatarColor(String name) {
    final colors = [
      Colors.teal, Colors.blue, Colors.purple,
      Colors.orange, Colors.pink,
    ];
    return colors[name.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2C34),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: _avatarColor(widget.chat.contactName),
              child: Text(
                widget.chat.contactName[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.contactName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'en ligne',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) => MessageBubble(
                message: _messages[index],
                onPlayAudio: _playAudio,
              ),
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    // Barre d'enregistrement
    if (_isRecording) {
      return Container(
        color: const Color(0xFF1F2C34),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            // Bouton annuler
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: _cancelRecording,
            ),
            const Icon(Icons.mic, color: Color(0xFF00A884), size: 22),
            const SizedBox(width: 8),
            Text(
              _formatDuration(_recordSeconds),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // Bouton envoyer
            CircleAvatar(
              backgroundColor: const Color(0xFF00A884),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: _stopAndSendAudio,
              ),
            ),
          ],
        ),
      );
    }

    // Barre normale
    return Container(
      color: const Color(0xFF1F2C34),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.emoji_emotions_outlined,
              color: Colors.grey, size: 26),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF2A3942),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.attach_file, color: Colors.grey, size: 22),
                    SizedBox(width: 4),
                    Icon(Icons.camera_alt_outlined,
                        color: Colors.grey, size: 22),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          CircleAvatar(
            backgroundColor: const Color(0xFF00A884),
            child: IconButton(
              icon: Icon(
                _hasText ? Icons.send : Icons.mic,
                color: Colors.white,
                size: 20,
              ),
              onPressed: _hasText ? _sendMessage : _startRecording,
            ),
          ),
        ],
      ),
    );
  }
}