import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';

class Languages extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {
    'ar':Ar.json ,
    'en':En.json ,
  };

}