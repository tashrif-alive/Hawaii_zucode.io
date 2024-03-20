import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';
import '../../admin/widgets/dot_indicator.dart';

class DestinationPoster extends StatefulWidget {
  const DestinationPoster({Key? key});

  @override
  State<DestinationPoster> createState() => _DestinationPosterState();
}

class _DestinationPosterState extends State<DestinationPoster> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 205,
          width: double.infinity,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('destinationBanner')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final bannerList =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return data['imgUrl'] ?? '';
              }).toList();
              return ImageCarousel(bannerList: bannerList);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
      ],
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.bannerList});

  final List bannerList;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _pageController;
  late final Timer _timer;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (_pageController.hasClients) {
        if (currentPage < widget.bannerList.length - 1) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 190,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            scrollDirection: Axis.horizontal,
            itemCount: widget.bannerList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 200,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  image: DecorationImage(
                    image: NetworkImage(widget.bannerList[index]),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(

                      child: Container(
                        margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(5),
                          top: getProportionateScreenHeight(15),
                          bottom: getProportionateScreenHeight(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenWidth(15),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(7)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "search".toLowerCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                const Icon(Icons.circle,size: 5,color: Colors.white70),
                                const SizedBox(width: 5,),
                                Text(
                                  "fly".toLowerCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                const Icon(Icons.circle,size: 5,color: Colors.white70),
                                const SizedBox(width: 5,),
                                Text(
                                  "go".toLowerCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.bannerList.length; i++)
              HorizontalDotIndicator(
                currentPage: currentPage,
                index: i,
              ),
            // Add more indicators if needed
          ],
        ),
      ],
    );
  }
}
