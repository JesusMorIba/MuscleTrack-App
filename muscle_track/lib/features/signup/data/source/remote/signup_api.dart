import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/data/remote/endpoint.dart';
import 'package:muscle_track/core/data/remote/network_service.dart';
import 'package:muscle_track/features/signup/data/dto/dto.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api.g.dart';

final signupApiProvider = Provider.autoDispose<SignupApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SignupApi(dio);
});

@RestApi()
abstract class SignupApi {
  factory SignupApi(Dio dio) => _SignupApi(dio);

  @POST(signupEndPoint)
  Future<SignupResponse> signup(@Body() SignupRequest signupRequest);
}
