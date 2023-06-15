import 'package:flutter_textfield_validation/flutter_textfield_validation.dart';
class Validate{

 static String? nameValidator(String? value) {
     if(value!.validateName()){
      return null;
     }
     else if(value.isEmpty){
      return 'Please enter a name';
     }
     else{
      return 'please enter valid name';
     }
  }

static String? emailValidator(String? value) {
     if(value!.validateEmail()){
      return null;
     }else if(value.isEmpty){
     return 'Please enter an email';
     }else{
      return 'Please enter valid email';
     }
  }

static String? passwordValidator(String? value) {
     if(value!.validatePassword()){
      return null;
     }
     else if(value.isEmpty){
      return 'Please enter a password';
     }
     else if(value.length<6){
      return 'Password should be more than 6 characters';
     }
     else{
      return 'Please enter valid password';
     }
  }

static String? phoneValidator(String? value) {
     if(value!.validatePhone()){
      return null;
     }
     else if(value.isEmpty){
      return 'Please enter a phone number';
     }
     else{
      return 'Please enter valid phone';
     }
  }
   
 static  String? addressValidator(String? value) {
     if(value!.validateAddress()){
      return null;
     }
     else if(value.isEmpty){
      return 'Please enter an address';
     }
     else{
      return 'Please enter valid address';
     }
  }
}