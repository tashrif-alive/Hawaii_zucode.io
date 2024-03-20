import 'dart:typed_data'; // Import for Uint8List

class ImageModel {
  final Uint8List data; // Field to hold image data
  final String imageUrl;

  ImageModel({required this.data, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'data': data, // Include image data in the map
      'imageUrl': imageUrl,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      data: map['data'],
      imageUrl: map['imageUrl'],
    );
  }
}
