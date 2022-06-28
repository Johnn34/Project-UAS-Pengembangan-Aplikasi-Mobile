import 'package:flutter/material.dart';
import 'package:flutter_e_wallet/screens/auth/login.dart';
import 'package:flutter_e_wallet/screens/home/home.dart';
import 'package:flutter_e_wallet/widgets/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
    );
  }

  void _checkUserSementara(bool user) async {
    await Future.delayed(const Duration(seconds: 2));
    wPushReplaceTo(
      context,
      user ? const Home() : const Login(),
    );
  }
}
