import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/friend_model.dart';
import '../services/chat_service.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  final ChatService _chatService = ChatService();
  List<Friend> _friends = [];
  final List<Friend> _selectedFriends = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    final friends = await _chatService.getFriends();
    setState(() {
      _friends = friends;
      _isLoading = false;
    });
  }

  void _toggleFriend(Friend friend) {
    setState(() {
      friend.isSelected = !friend.isSelected;
      if (friend.isSelected) {
        _selectedFriends.add(friend);
      } else {
        _selectedFriends.removeWhere((f) => f.id == friend.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Friends',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Return selected friends or navigate to group chat
              Navigator.pop(context, _selectedFriends);
            },
            child: const Text(
              'DONE',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildSearchBar(),
                if (_selectedFriends.isNotEmpty) _buildSelectedFriendsList(),
                Expanded(
                  child: ListView.builder(
                    itemCount: _friends.length,
                    itemBuilder: (context, index) => _buildFriendItem(_friends[index]),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Search Friend',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedFriendsList() {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _selectedFriends.length,
        itemBuilder: (context, index) {
          final friend = _selectedFriends[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(friend.avatar),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () => _toggleFriend(friend),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white, size: 12),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFriendItem(Friend friend) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(friend.avatar),
      ),
      title: Text(
        friend.name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      trailing: GestureDetector(
        onTap: () => _toggleFriend(friend),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: friend.isSelected ? primaryColor : Colors.grey[300]!,
              width: 2,
            ),
            color: friend.isSelected ? primaryColor : Colors.transparent,
          ),
          child: friend.isSelected
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : null,
        ),
      ),
    );
  }
}
