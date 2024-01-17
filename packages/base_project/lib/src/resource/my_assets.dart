class MyAssets {
  static const String _assetPath = 'packages/base_project/lib/assets';
  static String getIconPNG(String myIcon) {
    return '$_assetPath/icons/$myIcon.png';
  }

  static String getIconSVG(String myIcon) {
    return '$_assetPath/icons/$myIcon.svg';
  }

  static String getImagePNG(String myImage) {
    return '$_assetPath/images/$myImage.png';
  }

  static String getImageSVG(String myImage) {
    return '$_assetPath/images/$myImage.svg';
  }
}

class LocTroiAsset {
  static String logo = MyAssets.getImagePNG("logo");
  static String logo1 = MyAssets.getImagePNG("logo1");
  static String logoSVG = MyAssets.getImageSVG("logo");
  static String logoSVGNoBG = MyAssets.getImageSVG("logo_no_bg");
  static final String logoCanLuaInternal =
      MyAssets.getImagePNG("logo_canlua_internal");
  static final String logoChoGia = MyAssets.getImagePNG("logo_chotgia");
}
