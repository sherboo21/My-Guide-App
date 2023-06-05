import 'package:flutter/material.dart';

class ProfileData {
  final formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
}
