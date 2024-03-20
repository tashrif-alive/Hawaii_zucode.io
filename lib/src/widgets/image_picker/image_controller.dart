import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageController {
  final CollectionReference images =
      FirebaseFirestore.instance.collection('images');
  final ImagePicker _imagePicker = ImagePicker();

  Future<String> uploadImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Reference ref =
          FirebaseStorage.instance.ref().child('images').child(pickedFile.path);
      UploadTask uploadTask = ref.putFile(File(pickedFile.path));
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } else {
      throw Exception('No image selected');
    }
  }
}
