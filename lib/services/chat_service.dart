import '../models/chat_model.dart';
import '../models/friend_model.dart';

class ChatService {
  Future<List<Friend>> getFriends() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Friend(id: 'f1', name: 'Pena Valdez', avatar: 'assets/images/Guide Modal.png'),
      Friend(id: 'f2', name: 'Gil Hajoon', avatar: 'assets/images/Mask Group copy 4.png'),
      Friend(id: 'f3', name: 'Fitzgerald', avatar: 'assets/images/Guide Modal (3).png'),
      Friend(id: 'f4', name: 'KerriBarber', avatar: 'assets/images/Mask Group (3).png'),
      Friend(id: 'f5', name: 'WhiteCastaneda', avatar: 'assets/images/Mask Group (1).png'),
    ];
  }

  Future<List<Friend>> searchFriends(String query) async {
    final friends = await getFriends();
    return friends.where((f) => f.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
  Future<List<ChatMessage>> getChatList() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      ChatMessage(
        id: '1',
        senderName: 'Tuan Tran',
        senderAvatar: 'assets/images/Guide Modal.png',
        lastMessage: 'It\'s a beautiful place',
        time: '10:30 AM',
      ),
      ChatMessage(
        id: '2',
        senderName: 'Emmy',
        senderAvatar: 'assets/images/Mask Group (1).png',
        lastMessage: 'We can start at 8am',
        time: '10:30 AM',
        unreadCount: 2,
      ),
      ChatMessage(
        id: '3',
        senderName: 'Khai Ho',
        senderAvatar: 'assets/images/Guide Modal (3).png',
        lastMessage: 'See you tomorrow',
        time: '11:30 AM',
      ),
    ];
  }

  Future<List<Message>> getMessages(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Message(
        id: 'm1',
        text: 'hi, this is Emmy',
        createdAt: DateTime(2020, 1, 28, 10, 30),
        isMe: false,
      ),
      Message(
        id: 'm2',
        text: 'It is a long established fact that a reader will be distracted by the',
        createdAt: DateTime(2020, 1, 28, 10, 30),
        isMe: false,
      ),
      Message(
        id: 'm3',
        text: 'as opposed to using \'Content here',
        createdAt: DateTime(2020, 1, 28, 10, 31),
        isMe: true,
      ),
      Message(
        id: 'm4',
        text: 'There are many variations of passages',
        createdAt: DateTime(2020, 1, 28, 10, 31),
        isMe: true,
      ),
    ];
  }

  Future<bool> sendMessage(String chatId, String text) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
