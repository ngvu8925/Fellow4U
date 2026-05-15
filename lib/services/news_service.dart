

class News {
  final String id;
  final String title;
  final String date;
  final String image;

  News({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
  });
}

class NewsService {
  Future<List<News>> getTravelNews() async {
    // final response = await ApiClient.instance.get('/news');
    // return (response.data as List).map((e) => News.fromJson(e)).toList();

    await Future.delayed(const Duration(milliseconds: 600));
    return [
      News(
        id: '1',
        title: 'New Destination in Danang City',
        date: 'Feb 5, 2020',
        image: 'assets/images/Mask Group copy.png',
      ),
      News(
        id: '2',
        title: r'$1 Flight Ticket',
        date: 'Feb 5, 2020',
        image: 'assets/images/Group 112.png',
      ),
      News(
        id: '3',
        title: 'Visit Korea in this Tet Holiday',
        date: 'Jan 26, 2020',
        image: 'assets/images/Group 114.png',
      ),
    ];
  }
}
