import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/data/remote/cloudinary_service_impl.dart';
import '../data/remote/cloudinary_service.dart';

final cloudinaryServiceProvider = Provider<CloudinaryService>((ref) {
  return CloudinaryServiceImpl();
});

final cloudinaryProvider = NotifierProvider<CloudinaryState, String>(
  CloudinaryState.new,
);

class CloudinaryState extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  String generateImageUrl(String imageId) {
    final cloudinaryService = ref.read(cloudinaryServiceProvider);
    return cloudinaryService.generateImageUrl(imageId);
  }
}
