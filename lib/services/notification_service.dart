import '../models/notification_model.dart';

class NotificationService {
  Future<List<NotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      NotificationModel(
        id: '1',
        title: 'Tuan Tran accepted your request',
        content: 'Tuan Tran accepted your request for the trip in Danang, Vietnam on Jan 20, 2020',
        date: 'Jan 16',
        avatar: 'assets/images/Guide Modal.png',
        type: NotificationType.accepted,
      ),
      NotificationModel(
        id: '2',
        title: 'Emmy sent you an offer',
        content: 'Emmy sent you an offer for the trip in Ho Chi Minh, Vietnam on Feb 12, 2020',
        date: 'Jan 16',
        avatar: 'assets/images/Mask Group (1).png',
        type: NotificationType.offer,
      ),
      NotificationModel(
        id: '3',
        title: 'Trip finished',
        content: 'Thanks! Your trip in Danang, Vietnam on Jan 20, 2020 has been finished. Please leave a review for the guide Tuan Tran.',
        date: 'Jan 24',
        avatar: 'assets/images/Mask Group copy.png', // Assuming Fellow4U logo is here or similar
        type: NotificationType.finished,
        hasAction: true,
      ),
    ];
  }
}
