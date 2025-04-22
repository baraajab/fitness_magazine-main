import 'package:flutter/material.dart';

class FeaturedArticleCard {
  int id;
  String title;
  String description;
  String imageUrl;
  String category;
  Color color;

  FeaturedArticleCard({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.color,
  });
}
