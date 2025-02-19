import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/posts/comment_model.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends BaseModel {
  final String author;
  final int authorId;
  final String? avatar;
  final String? description;
  final String? image;
  final bool isLiked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final int viewsCount;
  final bool isPublic;
  final bool allowComments;
  final List<CommentModel> comments;

  PostModel({
    required super.id,
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

  factory PostModel.fromJson(final Map<String, dynamic> json) => _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
