import 'package:trend/features/explore/data/models/remote/search_model.dart';
import 'package:trend/features/posts/data/models/CommentModel.dart';
import 'post_details_model.dart';

class PostModel {
  int id;
  String? author;
  int? authorId;
  String? avatar;
  String? description;
  String? image;
  bool? isLiked;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? likesCount;
  int? commentsCount;
  int? sharesCount;
  int? viewsCount;
  bool? isPublic;
  bool? allowComments;
  List<Comment>? comments;

  PostModel({
    required this.id,
    this.author,
    this.authorId,
    this.avatar,
    this.description,
    this.image,
    this.isLiked,
    this.likesCount,
    this.commentsCount,
    this.sharesCount,
    this.viewsCount,
    this.isPublic,
    this.allowComments,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });

  /// Factory Constructor from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      author: json['author'],
      authorId: json['author_id'],
      avatar: json['avatar'],
      description: json['description'],
      image: json['image'],
      isLiked: json['is_liked'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      sharesCount: json['shares_count'],
      viewsCount: json['views_count'],
      isPublic: json['is_public'],
      allowComments: json['allow_comments'],
      comments: (json['comments'] as List?)?.map((v) => Comment.fromJson(v)).toList() ?? [],
    );
  }

  /// Factory Constructor from PostDetailsModel
  factory PostModel.fromPostDetails(PostDetailsModel details) {
    return PostModel(
      id: details.id,
      author: details.author,
      authorId: details.authorId,
      avatar: details.avatar,
      description: details.description,
      image: details.image,
      isLiked: details.isLiked,
      createdAt: details.createdAt,
      updatedAt: details.updatedAt,
      likesCount: details.likesCount,
      commentsCount: details.commentsCount,
      sharesCount: details.sharesCount,
      viewsCount: details.viewsCount,
      isPublic: details.isPublic,
      allowComments: details.allowComments,
      comments: details.comments,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'author_id': authorId,
      'avatar': avatar,
      'description': description,
      'image': image,
      'is_liked': isLiked,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'likes_count': likesCount,
      'comments_count': commentsCount,
      'shares_count': sharesCount,
      'views_count': viewsCount,
      'is_public': isPublic,
      'allow_comments': allowComments,
      'comments': comments?.map((v) => v.toJson()).toList(),
    };
  }
}
