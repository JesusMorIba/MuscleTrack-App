import 'package:image_picker/image_picker.dart';

abstract class CloudinaryService {
  Future<bool> uploadToCloudinary(XFile? file);

  Future<String?> fetchFileFromCloudinary(String fileId);
}
