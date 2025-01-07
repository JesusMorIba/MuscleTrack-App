import 'package:muscle_track/features/signup/data/dto/dto.dart';

abstract interface class SignupRepository {
  Future<SignupResponse> signup(SignupRequest signupRequest);
}
