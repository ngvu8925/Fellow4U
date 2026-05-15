import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/chat_model.dart';
import '../services/chat_service.dart';
import 'add_friends_screen.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatMessage chat;

  const ChatDetailScreen({super.key, required this.chat});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = true;
  bool _isTyping = false;
  bool _isRecording = false;
  int _recordSeconds = 0;

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _messageController.addListener(() {
      setState(() {
        _isTyping = _messageController.text.isNotEmpty;
      });
    });
  }

  Future<void> _loadMessages() async {
    final messages = await _chatService.getMessages(widget.chat.id);
    setState(() {
      _messages.addAll(messages);
      _isLoading = false;
    });
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final text = _messageController.text;
    final newMessage = Message(
      id: DateTime.now().toString(),
      text: text,
      createdAt: DateTime.now(),
      isMe: true,
    );

    setState(() {
      _messages.add(newMessage);
      _messageController.clear();
    });

    await _chatService.sendMessage(widget.chat.id, text);
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordSeconds = 0;
    });
    _updateTimer();
  }

  void _updateTimer() {
    if (!_isRecording) return;
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _isRecording) {
        setState(() {
          _recordSeconds++;
        });
        _updateTimer();
      }
    });
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _messages.length + 1, // +1 for date separator
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildDateSeparator('Jan 28, 2020');
                      }
                      return _buildMessageBubble(_messages[index - 1]);
                    },
                  ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // If it's a group chat (for demo we use a Stack for 3 avatars)
          SizedBox(
            width: 70,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(widget.chat.senderAvatar),
                ),
                Positioned(
                  left: 15,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: const AssetImage('assets/images/Mask Group copy 4.png'),
                  ),
                ),
                Positioned(
                  left: 30,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: const AssetImage('assets/images/Mask Group (3).png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddFriendsScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF2FDFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add, color: primaryColor, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSeparator(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            date,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    bool isMe = message.isMe;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isMe)
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(widget.chat.senderAvatar),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.chat.senderName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(width: 8),
                Text(
                  '10:30 AM',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            )
          else
            Text(
              '10:31 AM',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFFF6F7FB) : primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 16),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: isMe ? Colors.black87 : Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: SafeArea(
        child: _isRecording ? _buildRecordingBar() : _buildDefaultBar(),
      ),
    );
  }

  Widget _buildDefaultBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: _startRecording,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7FB),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mic_none, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F7FB),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.image_outlined, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7FB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type message',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        if (_isTyping)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: _sendMessage,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRecordingBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _formatTime(_recordSeconds),
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black, size: 30),
              onPressed: _stopRecording,
            ),
            GestureDetector(
              onTap: _stopRecording,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.mic, color: primaryColor, size: 30),
                    CircularProgressIndicator(
                      value: (_recordSeconds % 60) / 60,
                      strokeWidth: 2,
                      valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: _stopRecording,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
