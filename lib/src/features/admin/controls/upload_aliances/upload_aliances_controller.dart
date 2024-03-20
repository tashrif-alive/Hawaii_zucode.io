import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawaii_beta/src/features/admin/controls/upload_aliances/upload_aliances_model.dart';

class AliancesBannerController {
  final CollectionReference aliancesBanners =
  FirebaseFirestore.instance.collection('aliancesBanners');

  Future<void> addAliancesBanner(String imgUrl) async {
    try {
      String id = _generateRandomId();

      await aliancesBanners.doc(id).set(
        AliancesBanner(
          id: id,
          imgUrl: imgUrl,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding banner: $e");
    }
  }

  Future<void> deleteAliancesBanner(String id, Function(bool) onDeleteCompleted) async {
    try {
      await aliancesBanners.doc(id).delete();
      onDeleteCompleted(true);
    } catch (e) {
      print("Error deleting banner: $e");
      onDeleteCompleted(false);
    }
  }

  Future<void> updateAliancesBanner(String id, String newImgUrl) async {
    try {
      await aliancesBanners.doc(id).update(
        {'imgUrl': newImgUrl},
      );
    } catch (e) {
      print("Error updating banner: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}

