import 'package:my_money/enums/category_icon.dart';

extension CategoryIconExtension on CategoryIcon {
  String get assetName => "assets/images/$name.png";
}
