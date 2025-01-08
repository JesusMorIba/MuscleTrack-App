import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String baseURL =
      dotenv.env['BASE_URL'] ?? 'BASE_URL is not configured';
}
