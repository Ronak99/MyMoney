part of '../parser.dart';

class PdfManager {
  Future<String> loadAndRetrieveContent({
    required String filename,
    required String password,
  }) async {
    try {
      // Load PDF from assets
      final ByteData data = await rootBundle.load(filename);
      final Uint8List bytes = data.buffer.asUint8List();

      return _unlockAndExtractContent(bytes: bytes, password: password);
    } catch (e) {
      throw Exception("PDF file not found in app bundle: $e");
    }
  }

  Future<String> loadAndRetrieveContentFromPdfFile(
    File file, {
    required String? password,
  }) async {
    final Uint8List bytes = await file.readAsBytes();
    return _unlockAndExtractContent(bytes: bytes, password: password);
  }

  String _unlockAndExtractContent({
    required Uint8List bytes,
    required String? password,
  }) {
    final Stopwatch stopwatch = Stopwatch()..start();

    try {
      PdfDocument? pdfDocument;

      if (password == null) {
        // Try to load PDF without password first
        try {
          pdfDocument = PdfDocument(inputBytes: bytes);
        } catch (e) {
          throw PdfLockedException();
        }
      }

      // If document is null or encrypted, try with password
      if (pdfDocument == null) {
        try {
          pdfDocument = PdfDocument(inputBytes: bytes, password: password);
        } catch (e) {
          throw PdfWrongPasswordException();
        }
      }

      return _extractTextFromPDF(pdfDocument);
    } catch (e) {
      rethrow;
    }
  }

  String _extractTextFromPDF(PdfDocument pdfDocument) {
    final fullText = PdfTextExtractor(pdfDocument).extractText();
    return fullText;
  }
}
