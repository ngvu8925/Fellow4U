import 'package:flutter/material.dart';
import '../models/guide_model.dart';
import '../services/guide_service.dart';

class GuideProvider with ChangeNotifier {
  final GuideService _guideService = GuideService();
  List<Guide> _guides = [];
  bool _isLoading = false;

  List<Guide> get guides => _guides;
  bool get isLoading => _isLoading;

  Future<void> fetchBestGuides() async {
    _isLoading = true;
    notifyListeners();

    try {
      _guides = await _guideService.getBestGuides();
    } catch (e) {
      debugPrint('Error fetching guides: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
