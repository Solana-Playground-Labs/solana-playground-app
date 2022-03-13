import 'package:flutter/material.dart';

class SolanaCookBookCard extends StatelessWidget {
  const SolanaCookBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepOrange.shade300,
          borderRadius: BorderRadius.all(const Radius.circular(15.0))),
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Solana Cookbook',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Developer resource that provides the essential concepts and recipes for building applications on Solana.',
                maxLines: 3,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
