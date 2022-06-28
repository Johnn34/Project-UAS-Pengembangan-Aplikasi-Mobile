import 'package:flutter/material.dart';
import 'package:flutter_e_wallet/screens/auth/login.dart';
import 'package:flutter_e_wallet/screens/auth/verif_email.dart';
import 'package:flutter_e_wallet/screens/home/home.dart';
import 'package:flutter_e_wallet/widgets/widgets.dart';

class AuthProvider with ChangeNotifier {
  /// Login with email dan password
  void LoginwithEmail(
      {@required BuildContext? context,
      String? email,
      required String password}) async {
    if (email == 'john@gmail.com' && password == '123123') {
      await Future.delayed(const Duration(seconds: 2));
      wPushReplaceTo(context!, const Home());
    } else {
      print('Gagal');
    }
  }

  /// Reset Password
  void resetPassword({
    @required BuildContext? context,
    String? email,
  }) {
    void _ForgotpasswordSementar() async {
      if (email!.isNotEmpty) {
        print(
          'Berhasil',
        );
        await Future.delayed(
          const Duration(
            seconds: 2,
          ),
        );
        wShowToast(
          'Email sended! please check your email to rest password.',
        );
        Navigator.pop(context!);
      } else {
        print('Gagal');
      }
    }
  }

  /// Register with email
  void egisterWithEmail(
      {@required BuildContext? context,
      String? name,
      String? email,
      String? password}) async {
    print(name);
    print(email);
    print(password);

    await Future.delayed(const Duration(seconds: 2));
    wPushReplaceTo(
      context!,
      const Login(),
    );

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return const VerifEmail();
        });
  }

  /// Resend email Verification
  Future<void> resendEmailVerif() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
  }
}
