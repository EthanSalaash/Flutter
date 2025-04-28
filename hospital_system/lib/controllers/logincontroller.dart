import 'package:get/get.dart';

class Logincontroller extends GetxController{
  var errorMessage = "".obs;
setErrorMessage(newErrorMessage)
{
  errorMessage.value = newErrorMessage;
}
}