// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: (json['id'] as num).toInt(),
      post: (json['post'] as num).toInt(),
      author: json['author'] as String,
      authorId: (json['author_id'] as num).toInt(),
      content: json['content'] as String,
      isLiked: json['is_liked'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      likesCount: (json['likes_count'] as num).toInt(),
      repliesCount: (json['replies_count'] as num).toInt(),
      likedUsers: (json['liked_users'] as List<dynamic>?)
          ?.map((e) => LikedUsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentOnComment: (json['comment_on_comment'] as num?)?.toInt(),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post': instance.post,
      'author': instance.author,
      'author_id': instance.authorId,
      'content': instance.content,
      'is_liked': instance.isLiked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'likes_count': instance.likesCount,
      'replies_count': instance.repliesCount,
      'liked_users': instance.likedUsers?.map((e) => e.toJson()).toList(),
      'comment_on_comment': instance.commentOnComment,
      'replies': instance.replies?.map((e) => e.toJson()).toList(),
    };
