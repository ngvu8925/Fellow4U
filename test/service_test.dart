import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/services/auth_service.dart';
import 'package:untitled1/services/trip_service.dart';

void main() {
  group('Service Tests', () {
    final authService = AuthService();
    final tripService = TripService();

    test('AuthService login success test', () async {
      final result = await authService.login('test@example.com', 'password');
      expect(result, isNotNull);
      expect(result!['token'], 'mock_token_123');
      expect(result['user']['email'], 'test@example.com');
    });

    test('AuthService login failure test', () async {
      final result = await authService.login('wrong@email.com', 'wrongpass');
      expect(result, isNull);
    });

    test('TripService getMyTrips test', () async {
      final trips = await tripService.getMyTrips();
      expect(trips, isNotEmpty);
      expect(trips.length, 10);
      expect(trips[0].title, 'Dragon Bridge Trip');
    });
  });
}
