import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';

class ILaunchUrl {
  static Future<void> launchCroasterFeedbackAndHelp() async {
    const String url = 'https://t.me/CroasterSupport';
    try {
      await launch(url, forceSafariVC: false);
    } catch (e) {
      throw 'Could not launch $url [$e]';
    }
  }

  static Future<void> launchCustomUrl(
    String url, {
    bool? forceSafariVC,
    bool forceWebView = false,
    bool enableJavaScript = false,
    bool enableDomStorage = false,
    bool universalLinksOnly = false,
    Map<String, String> headers = const <String, String>{},
    Brightness? statusBarBrightness,
    String? webOnlyWindowName,
  }) async {
    try {
      await launch(
        url,
        forceSafariVC: forceSafariVC,
        forceWebView: forceWebView,
        enableDomStorage: enableDomStorage,
        enableJavaScript: enableJavaScript,
        universalLinksOnly: universalLinksOnly,
        headers: headers,
        statusBarBrightness: statusBarBrightness,
        webOnlyWindowName: webOnlyWindowName,
      );
    } catch (e) {
      throw 'Could not launch $url [$e]';
    }
  }
}
