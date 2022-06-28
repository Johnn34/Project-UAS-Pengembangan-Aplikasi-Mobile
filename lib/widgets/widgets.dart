import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:fluttertoast/fluttertoast.dart';

/// widget loading aplikasi
Widget wAppLoading(context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    ),
  );
}

/// Navigator Push
Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

/// Navigator PushReplace
Future wPushReplaceTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

/// Submit Button
Widget wInputSubmit({context, title, onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      shape: const StadiumBorder(),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}

Future wShowToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}
