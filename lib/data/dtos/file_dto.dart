import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class FileDto {
  final String filePath;
  final String fileName;
  final Uint8List fileBytes;
  FileDto({required this.fileBytes,required this.filePath, required this.fileName});

  MultipartFile toMultipartFile()=>MultipartFile.fromBytes(fileBytes,
  filename: fileName,
  contentType: MediaType('image', fileName.split('.').last));


}
