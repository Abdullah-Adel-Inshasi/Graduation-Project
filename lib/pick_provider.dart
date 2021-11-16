
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class PicProvider extends ChangeNotifier{
   File? file;
  selectFile() async {
    XFile? imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile!.path);
    notifyListeners();
  }
}