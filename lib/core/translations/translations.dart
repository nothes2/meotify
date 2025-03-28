import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'package:meowdify/core/translations/en_US.dart';
import 'package:meowdify/core/translations/zh_cn.dart';

class MeoTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_CN': zhCN,
      };
}
