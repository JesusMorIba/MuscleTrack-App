import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/login/data/dto/request/login_request.dart';

abstract interface class LoginService {
  Future<Result<bool, Failure>> login(LoginRequest loginRequest);
}
