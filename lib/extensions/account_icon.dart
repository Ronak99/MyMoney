import 'package:my_money/enums/account_icon.dart';

extension AccountIconExtension on AccountIcon {
  String get assetName => "assets/images/$name.png";
}
