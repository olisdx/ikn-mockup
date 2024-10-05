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

  /// File path: assets/images/bg-motif.png
  AssetGenImage get bgMotif =>
      const AssetGenImage('assets/images/bg-motif.png');

  /// File path: assets/images/cloud.png
  AssetGenImage get cloud => const AssetGenImage('assets/images/cloud.png');

  /// File path: assets/images/collab.jpg
  AssetGenImage get collab => const AssetGenImage('assets/images/collab.jpg');

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/google-icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/images/google-icon.png');

  /// File path: assets/images/guest-icon.png
  AssetGenImage get guestIcon =>
      const AssetGenImage('assets/images/guest-icon.png');

  /// Directory path: assets/images/icons
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// File path: assets/images/ikn.jpg
  AssetGenImage get ikn => const AssetGenImage('assets/images/ikn.jpg');

  /// File path: assets/images/like.png
  AssetGenImage get like => const AssetGenImage('assets/images/like.png');

  /// File path: assets/images/person.png
  AssetGenImage get person => const AssetGenImage('assets/images/person.png');

  /// File path: assets/images/whatsapp.png
  AssetGenImage get whatsapp =>
      const AssetGenImage('assets/images/whatsapp.png');

  /// File path: assets/images/x.png
  AssetGenImage get x => const AssetGenImage('assets/images/x.png');

  /// File path: assets/images/youtube.png
  AssetGenImage get youtube => const AssetGenImage('assets/images/youtube.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgMotif,
        cloud,
        collab,
        facebook,
        googleIcon,
        guestIcon,
        ikn,
        like,
        person,
        whatsapp,
        x,
        youtube
      ];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/contact-icon.png
  AssetGenImage get contactIcon =>
      const AssetGenImage('assets/images/icons/contact-icon.png');

  /// File path: assets/images/icons/event-icon.png
  AssetGenImage get eventIcon =>
      const AssetGenImage('assets/images/icons/event-icon.png');

  /// File path: assets/images/icons/more-icon.png
  AssetGenImage get moreIcon =>
      const AssetGenImage('assets/images/icons/more-icon.png');

  /// File path: assets/images/icons/report-icon.png
  AssetGenImage get reportIcon =>
      const AssetGenImage('assets/images/icons/report-icon.png');

  /// File path: assets/images/icons/shop-icon.png
  AssetGenImage get shopIcon =>
      const AssetGenImage('assets/images/icons/shop-icon.png');

  /// File path: assets/images/icons/visit-icon.png
  AssetGenImage get visitIcon =>
      const AssetGenImage('assets/images/icons/visit-icon.png');

  /// File path: assets/images/icons/wifi-icon.png
  AssetGenImage get wifiIcon =>
      const AssetGenImage('assets/images/icons/wifi-icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        contactIcon,
        eventIcon,
        moreIcon,
        reportIcon,
        shopIcon,
        visitIcon,
        wifiIcon
      ];
}

class Assets {
  Assets._();

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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
