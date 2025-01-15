import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/core/data/remote/cloudinary_service.dart';

class CloudinaryServiceImpl extends CloudinaryService {
  @override
  String generateImageUrl(String imageId) {
    return '${Environment.cloudinaryURL}/$imageId';
  }
}
