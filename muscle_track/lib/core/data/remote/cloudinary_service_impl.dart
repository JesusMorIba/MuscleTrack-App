import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';
import 'package:muscle_track/core/core.dart';
import 'dart:convert';

import 'package:muscle_track/core/data/remote/cloudinary_service.dart';

class CloudinaryServiceImpl extends CloudinaryService {
  @override
  Future<bool> uploadToCloudinary(XFile? file) async {
    if (file == null) {
      return false;
    }

    try {
      String cloudinaryUrl = Environment.cloudinaryURL;

      var request =
          MultipartRequest('POST', Uri.parse('$cloudinaryUrl/image/upload'))
            ..fields['upload_preset'] = 'YOUR_UPLOAD_PRESET'
            ..files.add(await MultipartFile.fromPath('file', file.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var result = json.decode(responseData);
        print("Image uploaded successfully: ${result['secure_url']}");
        return true;
      } else {
        print("Failed to upload image. Status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return false;
    }
  }

  @override
  Future<String?> fetchFileFromCloudinary(String fileId) async {
    try {
      String cloudinaryUrl = Environment.cloudinaryURL;

      var response =
          await get(Uri.parse('$cloudinaryUrl/image/upload/$fileId'));

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return result['secure_url'];
      } else {
        print("Failed to fetch file. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching file: $e");
      return null;
    }
  }
}
