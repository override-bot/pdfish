import 'dart:io';

class FileData {
  String getFileName(File file) {
    return file.path.split('/').last;
  }
}
