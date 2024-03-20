import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'image_controller.dart';

class ImageView extends StatefulWidget {
  final Function (String)onUploadSuccess;

  const ImageView({super.key, required this.onUploadSuccess});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final ImageController _imageController = ImageController();
  bool isloading= false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        setState(() {
          isloading = true;
        });
        _imageController.uploadImage().then((imageUrl) {
          print('Image uploaded: $imageUrl');
          widget.onUploadSuccess(imageUrl);
          setState(() {
            isloading = false;
          });
        }).catchError((error) {
          // Handle errors
          print('Error uploading image: $error');
          setState(() {
            isloading = false;
          });
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
      ),
      child:isloading? const CircularProgressIndicator(): Text(
        'Upload-Logo',
        style: GoogleFonts.ubuntu(fontWeight: FontWeight.w400,color: Colors.white),
      ),
    );
  }
}
