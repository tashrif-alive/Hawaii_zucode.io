import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawaii_beta/src/features/admin/controls/upload_banners/upload_destination_banner_contoller.dart';

class ManageDestinationBannerList extends StatelessWidget {
  const ManageDestinationBannerList({Key? key});


  ///Alert_box
  void _showDeleteConfirmationDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this banner?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteBanner(context, id);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
  ///Delete_method
  void _deleteBanner(BuildContext context, String id) {
    DestinationBannerController().deleteDestinationBanner(id, (bool success) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Banner deleted successfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete banner'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('destinationBanner').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return _buildBannerItem(context, data, document.id);
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBannerItem(BuildContext context, Map<String, dynamic> data, String id) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),

      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              data['imgUrl'] ?? '',
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete,color: Colors.red,),
            onPressed: () => _showDeleteConfirmationDialog(context, id),
          ),
        ],
      ),
    );
  }


}
