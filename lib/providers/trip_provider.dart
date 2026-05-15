import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../services/trip_service.dart';

class TripProvider with ChangeNotifier {
  final TripService _tripService = TripService();
  List<Trip> _trips = [];
  bool _isLoading = false;

  List<Trip> get trips => _trips;
  bool get isLoading => _isLoading;

  List<Trip> get currentTrips => _trips.where((t) => !t.isFinished && t.status == '').toList();
  List<Trip> get nextTrips => _trips.where((t) => t.status != '' && !t.isFinished).toList();
  List<Trip> get pastTrips => _trips.where((t) => t.isFinished).toList();
  List<Trip> get wishList => _trips.where((t) => t.isSaved).toList();

  Future<void> fetchMyTrips() async {
    _isLoading = true;
    notifyListeners();

    try {
      _trips = await _tripService.getMyTrips();
    } catch (e) {
      debugPrint('Error fetching trips: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

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
