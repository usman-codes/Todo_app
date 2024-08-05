import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateNotifier extends StateNotifier<String> {
  DateNotifier() : super(_formatDate(DateTime.now())) {
    _startTimer();
  }

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 60), (Timer timer) {
      state = _formatDate(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  static String _formatDate(DateTime dateTime) {
    final DateFormat dateFormatter =
        DateFormat('EEE, MMM d, yyyy'); // Updated format
    return dateFormatter.format(dateTime);
  }
}

final maindateProvider = StateNotifierProvider<DateNotifier, String>((ref) {
  return DateNotifier();
});
