import 'dart:typed_data';

class FileDto {
  final String fileName;
  final Uint8List fileBytes;
  FileDto({required this.fileBytes, required this.fileName});
}
