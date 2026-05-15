class Guide {
  final String id;
  final String name;
  final String avatar;
  final String location;
  final double rating;
  final int reviews;
  final List<String> languages;
  final String description;

  Guide({
    required this.id,
    required this.name,
    required this.avatar,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.languages,
    this.description = '',
  });
}
