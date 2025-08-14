library parser;

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:my_money/extensions/list.dart';
import 'package:my_money/packages/parser/model/hdfc_statement_parser.dart';
import 'package:my_money/packages/parser/model/sbi_statement_parser.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:my_money/model/transaction.dart';

part 'model/bank_statement_parser.dart';
part 'model/fi_statement_parser.dart';
part 'model/icici_statement_parser.dart';

part 'manager/PdfManager.dart';
part 'service/bank_statement_service.dart';

