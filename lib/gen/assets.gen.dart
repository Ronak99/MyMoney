/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/baby.png
  AssetGenImage get baby => const AssetGenImage('assets/images/baby.png');

  /// File path: assets/images/beauty.png
  AssetGenImage get beauty => const AssetGenImage('assets/images/beauty.png');

  /// File path: assets/images/bills.png
  AssetGenImage get bills => const AssetGenImage('assets/images/bills.png');

  /// File path: assets/images/clothing.png
  AssetGenImage get clothing =>
      const AssetGenImage('assets/images/clothing.png');

  /// File path: assets/images/coupons.png
  AssetGenImage get coupons => const AssetGenImage('assets/images/coupons.png');

  /// File path: assets/images/dividend.png
  AssetGenImage get dividend =>
      const AssetGenImage('assets/images/dividend.png');

  /// File path: assets/images/education.png
  AssetGenImage get education =>
      const AssetGenImage('assets/images/education.png');

  /// File path: assets/images/electronics.png
  AssetGenImage get electronics =>
      const AssetGenImage('assets/images/electronics.png');

  /// File path: assets/images/entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('assets/images/entertainment.png');

  /// File path: assets/images/food.png
  AssetGenImage get food => const AssetGenImage('assets/images/food.png');

  /// File path: assets/images/friends.png
  AssetGenImage get friends => const AssetGenImage('assets/images/friends.png');

  /// File path: assets/images/health.png
  AssetGenImage get health => const AssetGenImage('assets/images/health.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/insurance.png
  AssetGenImage get insurance =>
      const AssetGenImage('assets/images/insurance.png');

  /// File path: assets/images/investments.png
  AssetGenImage get investments =>
      const AssetGenImage('assets/images/investments.png');

  /// File path: assets/images/refunds.png
  AssetGenImage get refunds => const AssetGenImage('assets/images/refunds.png');

  /// File path: assets/images/salary.png
  AssetGenImage get salary => const AssetGenImage('assets/images/salary.png');

  /// File path: assets/images/sale.png
  AssetGenImage get sale => const AssetGenImage('assets/images/sale.png');

  /// File path: assets/images/shopping.png
  AssetGenImage get shopping =>
      const AssetGenImage('assets/images/shopping.png');

  /// File path: assets/images/sport.png
  AssetGenImage get sport => const AssetGenImage('assets/images/sport.png');

  /// File path: assets/images/tax.png
  AssetGenImage get tax => const AssetGenImage('assets/images/tax.png');

  /// File path: assets/images/transportation.png
  AssetGenImage get transportation =>
      const AssetGenImage('assets/images/transportation.png');

  /// File path: assets/images/unknown.png
  AssetGenImage get unknown => const AssetGenImage('assets/images/unknown.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        baby,
        beauty,
        bills,
        clothing,
        coupons,
        dividend,
        education,
        electronics,
        entertainment,
        food,
        friends,
        health,
        home,
        insurance,
        investments,
        refunds,
        salary,
        sale,
        shopping,
        sport,
        tax,
        transportation,
        unknown
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
