import 'package:flutter/material.dart';
import 'package:flutter_e_wallet/provider/auth_provider.dart';
import 'package:flutter_e_wallet/screens/auth/forgot_password.dart';
import 'package:flutter_e_wallet/screens/auth/register.dart';
import 'package:flutter_e_wallet/utils/utils.dart';
import 'package:flutter_e_wallet/widgets/widget_auth.dart';
import 'package:flutter_e_wallet/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Email',
        ),
        validator: (val) => uValidator(
          value: val!,
          isRequred: true,
          isEmail: true,
          minLength: 6,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextFormField(
            controller: _password,
            obscureText: _obscureText,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (val) => uValidator(
              value: val!,
              isRequred: true,
              minLength: 6,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _inputForgot() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: const Text(
            'Forgot Password',
          ),
        ),
      ),
      onTap: () => wPushTo(
        context,
        const ForgotPassword(),
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context,
        title: 'Login',
        onPressed: () {
          if (!_formkey.currentState!.validate()) return;
          final auth = Provider.of<AuthProvider>(
            context,
            listen: false,
          );
          setState(() => _isLoading = true);

          auth.LoginwithEmail(
            context: context,
            email: _email.text,
            password: _password.text,
          );
        });
  }

  Widget _googleSignIn() {
    return wGoogleSinIn(
      onPressed: _googleSignIn,
    );
  }

  Widget _textRegiter() {
    return wTextLink(
      text: 'Don\'t have an account yet ?',
      title: 'Register',
      onTap: () => wPushReplaceTo(context, const Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      wAauthTitle(
                        title: 'Login',
                        subtitle: 'Eneter your email & password',
                      ),
                      _inputEmail(),
                      _inputPassword(),
                      _inputForgot(),
                      _inputSubmit(),
                      wTextDivider(),
                      _googleSignIn(),
                      _textRegiter(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
