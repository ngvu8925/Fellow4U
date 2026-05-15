import '../models/user_model.dart';

class UserService {
  Future<UserProfile> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserProfile(
      id: 'u1',
      name: 'Yoo Jin',
      email: 'yoojin@gmail.com',
      avatar: 'assets/images/Guide Modal (1).png',
      coverImage: 'assets/images/Group 114.png', // Assuming a sunset landscape
    );
  }

  Future<List<String>> getMyPhotos() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      'assets/images/Mask Group copy.png',
      'assets/images/Group 112.png',
      'assets/images/Group 114.png',
      'assets/images/Mask Group copy.png',
    ];
  }

  Future<List<Journey>> getMyJourneys() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      Journey(
        id: 'j1',
        title: 'A memory in Danang',
        location: 'Danang, Vietnam',
        date: 'Jan 20, 2020',
        likes: 234,
        images: [
          'assets/images/Mask Group copy.png',
          'assets/images/Mask Group copy 4.png',
          'assets/images/Mask Group copy.png',
        ],
      ),
      Journey(
        id: 'j2',
        title: 'Sapa in spring',
        location: 'Sapa, Vietnam',
        date: 'Jan 20, 2020',
        likes: 234,
        images: [
          'assets/images/Mask Group (1).png',
          'assets/images/Mask Group (3).png',
          'assets/images/Mask Group (1).png',
        ],
      ),
    ];
  }
}
