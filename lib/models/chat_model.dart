class ChatMessage {
  final String id;
  final String senderName;
  final String senderAvatar;
  final String lastMessage;
  final String time;
  final int unreadCount;

  ChatMessage({
    required this.id,
    required this.senderName,
    required this.senderAvatar,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
  });
}

class Message {
  final String id;
  final String text;
  final DateTime createdAt;
  final bool isMe;

  Message({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.isMe,
  });
}
