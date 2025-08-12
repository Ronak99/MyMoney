part of '../parser.dart';

class _PdfManager {
  Future<String> loadAndRetrieveContent({required String password}) async {
    try {
      // Load PDF from assets
      final ByteData data = await rootBundle.load('assets/statement.pdf');
      final Uint8List bytes = data.buffer.asUint8List();

      return await _unlockAndExtractContent(bytes, password);
    } catch (e) {
      throw Exception("PDF file not found in app bundle: $e");
    }
  }

  Future<void> loadAndRetrieveContentFromPdfFile(
    File file, {
    required String password,
  }) async {
    try {
      final Uint8List bytes = await file.readAsBytes();
      await _unlockAndExtractContent(bytes, password);
    } catch (e) {
      throw Exception("Failed to load PDF file: $e");
    }
  }

  Future<String> _unlockAndExtractContent(
      Uint8List bytes, String password) async {
    final Stopwatch stopwatch = Stopwatch()..start();

    try {
      PdfDocument? pdfDocument;

      // Try to load PDF without password first
      try {
        pdfDocument = PdfDocument(inputBytes: bytes);
      } catch (e) {
        // If loading fails, it might be password protected
        print("PDF might be encrypted, trying with password...");
      }

      // If document is null or encrypted, try with password
      if (pdfDocument == null) {
        try {
          pdfDocument = PdfDocument(inputBytes: bytes, password: password);
        } catch (e) {
          throw Exception("Failed to unlock PDF with provided password");
        }
      }

      return _extractTextFromPDF(pdfDocument);
    } catch (e) {
      throw Exception("Error processing PDF: $e");
    }
  }

  String _extractTextFromPDF(PdfDocument pdfDocument) {
    final fullText = PdfTextExtractor(pdfDocument).extractText();
    return fullText;
  }
}
