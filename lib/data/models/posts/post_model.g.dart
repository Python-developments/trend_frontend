// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: (json['id'] as num).toInt(),
      author: json['author'] as String,
      authorId: (json['author_id'] as num).toInt(),
      avatar: json['avatar'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isLiked: json['is_liked'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      likesCount: (json['likes_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      sharesCount: (json['shares_count'] as num).toInt(),
      viewsCount: (json['views_count'] as num).toInt(),
      isPublic: json['is_public'] as bool,
      allowComments: json['allow_comments'] as bool,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'author_id': instance.authorId,
      'avatar': instance.avatar,
      'description': instance.description,
      'image': instance.image,
      'is_liked': instance.isLiked,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'shares_count': instance.sharesCount,
      'views_count': instance.viewsCount,
      'is_public': instance.isPublic,
      'allow_comments': instance.allowComments,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
