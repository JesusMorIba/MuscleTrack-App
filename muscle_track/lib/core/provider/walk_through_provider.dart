import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final walkThroughProvider =
    NotifierProvider<WalkThroughState, bool>(WalkThroughState.new);

class WalkThroughState extends Notifier<bool> {
  static const _walkThroughKey = 'walkthrough_completed';

  @override
  bool build() {
    _loadWalkThroughState();
    return false;
  }

  Future<void> _loadWalkThroughState() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(_walkThroughKey) ?? false;
    state = value;
  }

  Future<void> setWalkThroughCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_walkThroughKey, value);
    state = value;
  }
}
