import 'package:get/get.dart';

validInput({required String val,required int min,required int max, String type='text'}){
  if(type=='username')
    {
      if(!GetUtils.isUsername(val)){
        return 'Not valid User Name';
      }
    }
  if(type=='email')
    {
      if(!GetUtils.isEmail(val)){
        return 'Not valid Email';
      }
    }
  if(type=='phone')
    {
      if(!GetUtils.isPhoneNumber(val)){
        return 'Not valid Phone number';
      }
    }
  if(val.isEmpty)
    {
      return 'value can not be Empty';
    }
  if(val.length<min){
    return 'value is too short the mini is $min';
    }
  if(val.length>max)
    {
      return'value cant be more than $max character';
    }

}