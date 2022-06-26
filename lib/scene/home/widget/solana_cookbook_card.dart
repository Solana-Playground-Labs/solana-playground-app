/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;
  final Color color;
  final Widget? child;

  const HomeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: SPCard(
        color: color,
        padding: const EdgeInsets.all(0),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      description,
                      maxLines: 3,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  if (child != null) child!,
                  if (onTap != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Icon(Icons.forward, color: Colors.black)],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
