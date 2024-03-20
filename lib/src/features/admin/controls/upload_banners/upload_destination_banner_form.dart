import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/admin/controls/upload_banners/upload_destination_banner_contoller.dart';
import '../../../../widgets/image_picker/image_view.dart';
import '../../widgets/admin_textform_field.dart';

class AddDestinationBannerForm extends StatefulWidget {
  @override
  _AddDestinationBannerFormState createState() =>
      _AddDestinationBannerFormState();
}

class _AddDestinationBannerFormState extends State<AddDestinationBannerForm> {
  final _bannerController = DestinationBannerController();
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _subtitle = '';
  String _imgUrl = '';
  String categories = 'Places';
  final List<String> _categoryOptions = ['Places', 'Hotels', 'Winter'];

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _bannerController.addDestinationBanner(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _title,
        subtitle: _subtitle,
        imgUrl: _imgUrl,
        categories: categories,
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Banner',style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: AdminTextFormField(
                    hintText: 'Title',
                    prefixIcon: Icons.text_fields_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _title = newValue!,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: AdminTextFormField(
                    hintText: 'Subtitle',
                    prefixIcon: Icons.subtitles,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a subtitle';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _subtitle = newValue!,

                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: DropdownButtonFormField<String>(
                          value: categories,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.image),
                            iconColor: Colors.grey,
                            hintText: "Destination",
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          items: _categoryOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              categories = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ImageView(onUploadSuccess: (String url) {
                          _imgUrl = url; // Store the uploaded image URL
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Add Banner',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
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
