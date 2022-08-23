import 'package:universal_platform/universal_platform.dart';

bool get isMobile => UniversalPlatform.isIOS || UniversalPlatform.isAndroid;
bool get isAndroid => UniversalPlatform.isAndroid;
bool get isIOS => UniversalPlatform.isIOS;
