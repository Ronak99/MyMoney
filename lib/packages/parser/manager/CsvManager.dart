part of '../parser.dart';

class CsvManager {
  Future<String> loadContent(File file) async {
    return await file.readAsString();
  }
}
