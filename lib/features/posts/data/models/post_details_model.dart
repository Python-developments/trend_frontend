import 'dart:convert';

import 'package:trend/features/explore/data/models/remote/search_model.dart';

import 'CommentModel.dart';

class PostDetailsModel {
  final int id;
  final String author;
  final int authorId;
  final String avatar;
  final String description;
  final String image;
  final bool isLiked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final int viewsCount;
  final bool isPublic;
  final bool allowComments;
  final List<Comment> comments;

  PostDetailsModel({
    required this.id,
    required this.author,
    required this.authorId,
    required this.avatar,
    required this.description,
    required this.image,
    required this.isLiked,
    required this.createdAt,
    required this.updatedAt,
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.viewsCount,
    required this.isPublic,
    required this.allowComments,
    required this.comments,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      id: json['id'],
      author: json['author'],
      authorId: json['author_id'],
      avatar: json['avatar'],
      description: json['description'],
      image: json['image'],
      isLiked: json['is_liked'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      sharesCount: json['shares_count'],
      viewsCount: json['views_count'],
      isPublic: json['is_public'],
      allowComments: json['allow_comments'],
      comments: (json['comments'] as List).map((e) => Comment.fromJson(e)).toList(),
    );
  }

}