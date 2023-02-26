import 'package:ecommerce/core/localization/ar.dart';
import 'package:ecommerce/core/localization/en.dart';
import 'package:get/get.dart';

class Languages extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {
    'ar':Ar.json ,
    'en':En.json ,
  };

}