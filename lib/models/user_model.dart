class UserProfile {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String coverImage;
  final String role;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.coverImage,
    this.role = 'Traveler',
  });
}

class Journey {
  final String id;
  final String title;
  final String location;
  final String date;
  final List<String> images;
  final int likes;

  Journey({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.images,
    required this.likes,
  });
}
