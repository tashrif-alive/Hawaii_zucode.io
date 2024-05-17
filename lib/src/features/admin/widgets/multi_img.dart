import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'multi_img_controller.dart';

class MultiImageView extends StatefulWidget {
  final Function(List<String>) onUploadSuccess;

  const MultiImageView({Key? key, required this.onUploadSuccess}) : super(key: key);

  @override
  _MultiImageViewState createState() => _MultiImageViewState();
}

class _MultiImageViewState extends State<MultiImageView> {
  final MultiImageController _imageController = MultiImageController();
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles;

  Future<void> _pickImages() async {
    try {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        setState(() {
          _imageFiles = pickedFiles;
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<void> _uploadImages() async {
    if (_imageFiles == null || _imageFiles!.isEmpty) {
      print('No images selected.');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      List<String> uploadedImageUrls = [];
      for (var file in _imageFiles!) {
        final imageUrl = await _imageController.uploadImage(file.path);
        uploadedImageUrls.add(imageUrl);
        print('Image uploaded: $imageUrl');
      }
      widget.onUploadSuccess(uploadedImageUrls);
    } catch (error) {
      print('Error uploading images: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: isLoading ? null : _pickImages,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'Select Images',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: isLoading ? null : _uploadImages,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
            'Upload Images',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
