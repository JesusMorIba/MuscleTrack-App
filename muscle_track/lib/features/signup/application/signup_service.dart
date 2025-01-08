import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/signup/data/dto/dto.dart';

abstract interface class SignupService {
  Future<Result<bool, Failure>> signup(SignupRequest signupRequest);
}
