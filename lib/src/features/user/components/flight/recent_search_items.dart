import 'package:flutter/material.dart';
class RecentSearchResult extends StatelessWidget {
  const RecentSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Center(child: Text('Container 1')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: const Center(child: Text('Container 2')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('Container 3')),
            ),
          ],
        ),
      ],
    );
  }
}
