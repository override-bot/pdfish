import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdfish/data/datasources/system_files.dart';

class PDFRepository {
  final SystemFiles _systemFiles = SystemFiles();
  Future<String> createAppFolder() async {
    final externalDir = await getExternalStorageDirectory();
    const appFolderName = 'pdfish';
    final appFolderPath = '${externalDir?.path}/$appFolderName';
    if (await Directory(appFolderPath).exists() == false) {
      await Directory(appFolderPath).create();
    }
    return appFolderPath;
  }

  Future<List<File>> getAppPdf() async {
    String path = await createAppFolder();
    return _systemFiles.getPDFfilesFromSource(path);
  }

  Future<File> createAppCopy(File file) async {
    String path = await createAppFolder();
    return _systemFiles.moveFile(file, path);
  }
}
