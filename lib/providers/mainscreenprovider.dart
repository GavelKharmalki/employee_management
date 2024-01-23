import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreenProvider extends ChangeNotifier {
  String _currentTime = _formatTime(DateTime.now());
  String get currentTime => _currentTime;
  bool _timeRecorded = false;
  int _lastRecordedDay = DateTime.now().day;
  String _checkout = _formatTime(DateTime.now());
  String get checkout => _checkout;
  DateTime? _startTime;
  DateTime? _endTime;
  Duration _totalBreakDuration = Duration.zero;
  bool _breakActive = false;
  bool get isBreakActive => _breakActive;
  String _afterBreak = _formatStartTime(DateTime.now());
  String get afterBreak => _afterBreak;
  bool _checkedOut = false;
  bool get getCheckoutButton => _checkedOut;
  bool _checkedInButton = false;
  bool get checkedInButton => _checkedInButton;
  bool _onBreakFinishIcon = false;
  bool get onBreakFinishIcon => _onBreakFinishIcon;
  // Check in
  String recordTime() {
    // Get the current day
    int currentDay = DateTime.now().day;

    // Check if it's a new day
    if (_lastRecordedDay != currentDay) {
      _checkedInButton = false;
      _timeRecorded = false;
      _checkedOut = false; // Reset checkout status on a new day
      _lastRecordedDay = currentDay;
    }

    // Record time if it hasn't been recorded today
    if (!_timeRecorded) {
      _currentTime = _formatTime(DateTime.now());
      _checkedInButton = true;
      _timeRecorded = true;
      notifyListeners();
    }
    return _currentTime;
  }

  // Start break
  void startBreak() {
    if (!_breakActive) {
      _startTime = DateTime.now();
      _breakActive = true;
      notifyListeners();
    }
  }

  // End break
  void endBreak() {
    if (_breakActive) {
      _endTime = DateTime.now();
      _totalBreakDuration += _endTime!.difference(_startTime!);
      _startTime = null;
      _breakActive = false;
      _onBreakFinishIcon = true;
      notifyListeners();
    }
  }

  // After Break
  String afterBreakDuration() {
    _afterBreak = _formatTime(DateTime.now());
    notifyListeners();
    return _afterBreak;
  }

 

  // Checkout
  String getCheckOut() {
    if (!_checkedOut) {
      _checkout = _formatTime(DateTime.now());
      _checkedOut = true;
      notifyListeners();
    }
    return _checkout;
  }

  String getTotalBreakDuration() {
    int hours = _totalBreakDuration.inHours;
    int minutes = _totalBreakDuration.inMinutes.remainder(60);
    int seconds = _totalBreakDuration.inSeconds.remainder(60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String _formatStartTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}