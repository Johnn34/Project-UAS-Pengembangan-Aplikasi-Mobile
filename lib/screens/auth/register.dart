import 'package:flutter/material.dart';
import 'package:flutter_e_wallet/provider/auth_provider.dart';
import 'package:flutter_e_wallet/screens/auth/login.dart';
import 'package:flutter_e_wallet/screens/auth/verif_email.dart';
import 'package:flutter_e_wallet/utils/utils.dart';
import 'package:flutter_e_wallet/widgets/widget_auth.dart';
import 'package:flutter_e_wallet/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConf = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isLoading = false;

  Widget _inputName() {
    return Container(
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        controller: _name,
        decoration: const InputDecoration(
          hintText: 'Name',
          helperText: 'Enter Full Name',
        ),
        validator: (val) => uValidator(
          value: val!,
          isRequred: true,
          minLength: 3,
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(
          hintText: 'Email',
          helperText: 'Enter Email',
        ),
        validator: (val) => uValidator(
          value: val!,
          isRequred: true,
          isEmail: true,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: _password,
            decoration: const InputDecoration(
              hintText: '******',
              helperText: 'Password',
            ),
            validator: (val) => uValidator(
              value: val!,
              isRequred: true,
              minLength: 6,
              match: _password.text,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: _passwordConf,
            decoration: const InputDecoration(
              hintText: '******',
              helperText: 'Confirm Password',
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context,
        title: 'Login',
        onPressed: () {
          if (!_formkey.currentState!.validate()) return;
          setState(() => _isLoading = true);
          final auth = Provider.of<AuthProvider>(context, listen: false);
          auth.egisterWithEmail(
            context: context,
            name: _name.text,
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

  Widget _textLogin() {
    return wTextLink(
      text: 'Already have an account?',
      title: 'Login',
      onTap: () => wPushReplaceTo(
        context,
        const Login(),
      ),
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
              body: SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        wAauthTitle(
                          title: 'Register',
                          subtitle: 'Fill the form to regiter',
                        ),
                        _inputName(),
                        _inputEmail(),
                        _inputPassword(),
                        const SizedBox(
                          height: 30,
                        ),
                        _inputSubmit(),
                        wTextDivider(),
                        _googleSignIn(),
                        _textLogin(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
