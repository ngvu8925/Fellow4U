import 'package:flutter/material.dart';
import '../models/trip_model.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = [
    Trip(
      id: '1',
      title: 'Dragon Bridge Trip',
      image: 'assets/images/danang_bridge.png',
      location: 'Da Nang, Vietnam',
      date: 'Jan 30, 2020',
      time: '13:00 - 15:00',
      price: '\$20.00',
      guide: 'Tuan Tran',
      guideAvatar: 'assets/images/Mask Group copy.png',
      attractions: ['Ho Guom', 'Ho Hoan Kiem', 'Pho 12 Pho Kim Ma'],
    ),
    Trip(
      id: '2',
      title: 'Ho Guom Trip',
      image: 'assets/images/ho_guom.png',
      location: 'Hanoi, Vietnam',
      date: 'Feb 2, 2020',
      time: '8:00 - 10:00',
      price: '\$20.00',
      guide: 'Emmy',
      guideAvatar: 'assets/images/Mask Group (1).png',
      status: 'Confirmed',
      attractions: ['Ho Guom', 'Ho Hoan Kiem', 'Pho 12 Pho Kim Ma'],
    ),
    // Add more mock trips if needed
  ];

  List<Trip> get trips => _trips;

  List<Trip> get currentTrips => _trips.where((t) => !t.isFinished && t.status == '').toList();
  List<Trip> get nextTrips => _trips.where((t) => t.status != '' && !t.isFinished).toList();
  List<Trip> get pastTrips => _trips.where((t) => t.isFinished).toList();

  void markAsFinished(String id) {
    final index = _trips.indexWhere((t) => t.id == id);
    if (index != -1) {
      _trips[index].isFinished = true;
      notifyListeners();
    }
  }

  void toggleSave(String id) {
    final index = _trips.indexWhere((t) => t.id == id);
    if (index != -1) {
      _trips[index].isSaved = !_trips[index].isSaved;
      notifyListeners();
    }
  }
}
