
import 'package:trend/data/dtos/file_dto.dart';

class CreatePostDto {
  final FileDto image;
  final String description;

  CreatePostDto({required this.image, required this.description});


  Map<String, dynamic> toJson() =>{
    'image':image.toMultipartFile(),
    'description':description,
  };

}
