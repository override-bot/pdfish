import 'dart:io';

import 'package:pdfish/utils/file_data.dart';

class SystemFiles {
  Future<List<File>> getPDFfilesFromSource(String folder) async {
    try {
      final directory = Directory(folder);
      if (await directory.exists()) {
        final files = await directory.list().where((entity) {
          return entity is File && entity.path.endsWith('.pdf');
        }).map((entity) {
          return File(entity.path);
        }).toList();
        return files;
      } else {
        throw Exception("Folder not found");
      }
    } catch (e) {
      throw Exception('Error retrieving files: $e');
    }
  }

  Future<File> moveFile(File file, String destinationPath) async {
    try {
      String fileName = FileData().getFileName(file);
      final destinationFile = '$destinationPath/$fileName';
      File? newFile;
      if (await file.exists()) {
        newFile = await file.copy(destinationFile);
        return newFile;
      } else {
        throw Exception('Source file does not exist.');
      }
    } catch (e) {
      throw Exception('Error moving file: $e');
    }
  }
}
