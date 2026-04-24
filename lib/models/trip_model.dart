class Trip {
  final String id;
  final String title;
  final String image;
  final String location;
  final String date;
  final String time;
  final String duration;
  final String price;
  final String guide;
  final String guideAvatar;
  final String status;
  final List<String> attractions;
  bool isSaved;
  bool isFinished;

  Trip({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
    required this.date,
    required this.time,
    this.duration = '',
    required this.price,
    required this.guide,
    required this.guideAvatar,
    this.status = '',
    this.attractions = const [],
    this.isSaved = false,
    this.isFinished = false,
  });
}
