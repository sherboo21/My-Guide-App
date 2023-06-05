import 'package:flutter/material.dart';

class SignInData {
  final formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
