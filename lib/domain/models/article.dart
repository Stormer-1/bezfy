import 'package:flutter/material.dart';

class Article {
  Article({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    required this.viewCount,
  });

  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final IconData icon;
  final String category;
  final int viewCount;
}
