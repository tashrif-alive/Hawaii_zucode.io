import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationBannerCarousel extends StatelessWidget {
  const DestinationBannerCarousel({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
          ),
          items: documents.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data['imgUrl'] ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
