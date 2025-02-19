import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/posts/liked_users_model.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends BaseModel {
  final int post;
  final String author;
  final int authorId;
  final String content;
  final bool isLiked;
  final String createdAt;
  final String updatedAt;
  final int likesCount;
  final int repliesCount;
  final List<LikedUsersModel>? likedUsers;
  final int? commentOnComment;
  final List<CommentModel>? replies;

  CommentModel({
    required super.id,
    required this.post,
    required this.author,
    required this.authorId,
    required this.content,
    required this.isLiked,
    required this.createdAt,
    required this.updatedAt,
    required this.likesCount,
    required this.repliesCount,
    required this.likedUsers,
    required this.commentOnComment,
    required this.replies,
  });

  factory CommentModel.fromJson(final Map<String, dynamic> json) => _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
