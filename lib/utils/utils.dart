import 'package:flutter/cupertino.dart';

String? uValidator({
  @required String? value,
  bool isRequred = false,
  bool isEmail = false,
  int? minLength,
  String? match,
}) {
  if (isRequred) {
    if (value!.isEmpty) {
      return 'Requared';
    }
  }

  if (isEmail) {
    if (!value!.contains('@') || !value.contains('.')) {
      return 'Invalid Email';
    }
  }

  if (minLength != null) {
    if (value!.length < minLength) {
      return 'Min $minLength character';
    }
  }

  if (match != null) {
    if (value != match) {
      return 'Not Match';
    }
  }

  return null;
}
