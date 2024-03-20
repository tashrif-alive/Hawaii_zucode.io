
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawaii_beta/src/features/admin/controls/upload_banners/upload_destination_banner_model.dart';


class DestinationBannerController {
  final CollectionReference destinationBanner =
  FirebaseFirestore.instance.collection('destinationBanner');

  Future<void> addDestinationBanner({
    required String id,
    required String title,
    required String subtitle,
    required String imgUrl,
    required String categories,
  }) async {
    try {
      await destinationBanner.doc(id).set(
        DestinationBanner(
          id: id,
          title: title,
          subtitle: subtitle,
          imgUrl: imgUrl,
          categories: categories,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding banner: $e");
    }
  }

  Future<void> deleteDestinationBanner(String id, Function(bool) onDeleteCompleted) async {
    try {
      await destinationBanner.doc(id).delete();
      onDeleteCompleted(true);
    } catch (e) {
      print("Error deleting banner: $e");
      onDeleteCompleted(false);
    }
  }

  Future<void> updateDestinationBanner({
    required String id,
    required String newTitle,
    required String newSubtitle,
    required String newImgUrl,
    required String newCategories,
  }) async {
    try {
      await destinationBanner.doc(id).update(
        {
          'title': newTitle,
          'subtitle': newSubtitle,
          'imgUrl': newImgUrl,
          'category': newCategories,
        },
      );
    } catch (e) {
      print("Error updating banner: $e");
    }
  }
}
