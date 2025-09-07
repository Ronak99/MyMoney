library parser;

import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:my_money/extensions/list.dart';
import 'package:my_money/packages/parser/enums/bank.dart';
import 'package:my_money/packages/parser/exceptions/exceptions.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:my_money/model/transaction.dart';

export 'enums/bank.dart';

part 'model/parser.dart';
part 'model/fi_statement_parser.dart';
part 'model/icici_statement_parser.dart';
part 'model/hdfc_statement_parser.dart';
part 'model/csv_parser.dart';
part 'model/sbi_statement_parser.dart';

part 'manager/PdfManager.dart';
part 'manager/CsvManager.dart';

part 'service/bank_statement_service.dart';
part 'service/app_statement_service.dart';
