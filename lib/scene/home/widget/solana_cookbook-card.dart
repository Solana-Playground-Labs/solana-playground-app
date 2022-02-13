import 'package:flutter/material.dart';

class SolanaCookBookCard extends StatelessWidget {
  const SolanaCookBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepOrange.shade300,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      width: 280,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Solana Cookbook',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Developer resource that provides the essential concepts and recipes for building applications on Solana.',
                maxLines: 3,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 5),
            child: ElevatedButton(onPressed: () {}, child: Text('Open')),
          )
        ],
      ),
    );
  }
}
