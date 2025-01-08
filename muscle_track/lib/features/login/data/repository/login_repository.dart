import 'package:muscle_track/features/login/data/dto/dto.dart';

abstract interface class LoginRepository {
  Future<LoginResponse> login(LoginRequest loginRequest);
}
