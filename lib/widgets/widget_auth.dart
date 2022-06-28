import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Auth Title
Widget wAauthTitle({title, subtitle}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(
      bottom: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    ),
  );
}

/// Divider with Text
Widget wTextDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Row(
      children: const <Widget>[
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'OR CONNECT WITH',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(child: Divider())
      ],
    ),
  );
}

/// signIn with Google
Widget wGoogleSinIn({onPressed}) {
  return Container(
    width: double.infinity,
    child: RaisedButton.icon(
      shape: const StadiumBorder(),
      icon: const Icon(MdiIcons.google),
      label: const Text(
        'Google',
      ),
      onPressed: onPressed,
    ),
  );
}

Widget wTextLink({text, title, onTap}) {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
        ),
        GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: onTap)
      ],
    ),
  );
}
