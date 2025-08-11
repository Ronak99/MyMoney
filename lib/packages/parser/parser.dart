library parser;

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:my_money/model/transaction.dart';

part 'model/bank_statement_parser.dart';
part 'model/fi_statement_parser.dart';

part 'manager/PdfManager.dart';
part 'service/parser_service.dart';