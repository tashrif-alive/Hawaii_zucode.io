import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/admin/controls/upload_aliances/upload_aliances_controller.dart';
import '../../../../widgets/image_picker/image_view.dart';


class AliancesBannerFormView extends StatefulWidget {
  const AliancesBannerFormView({Key? key});

  @override
  _AliancesBannerFormViewState createState() => _AliancesBannerFormViewState();
}

class _AliancesBannerFormViewState extends State<AliancesBannerFormView> {
  final _aliancesBannerController = AliancesBannerController();
  final _formKey = GlobalKey<FormState>();

  String _imgUrl = '';

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _aliancesBannerController.addAliancesBanner(_imgUrl);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Aliances Banner Service',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Text(
                    "Add Aliances Banner",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                /// Upload Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ImageView(onUploadSuccess: (String url) {
                    _imgUrl = url; // Store the uploaded image URL
                  }),
                ),

                /// Add Aliances Banner Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add Aliances Banner',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
