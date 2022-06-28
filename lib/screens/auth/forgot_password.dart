import 'package:flutter/material.dart';
import 'package:flutter_e_wallet/provider/auth_provider.dart';
import 'package:flutter_e_wallet/utils/utils.dart';
import 'package:flutter_e_wallet/widgets/widget_auth.dart';
import 'package:flutter_e_wallet/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email = TextEditingController();
  late bool _isLoading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Email',
          helperText: 'Enter your email',
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

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context,
        title: 'Send',
        onPressed: () {
          if (!_formkey.currentState!.validate()) return;
          final auth = Provider.of<AuthProvider>(context, listen: false);
          setState(() => _isLoading = true);
          auth.resetPassword(
            context: context,
            email: _email.text,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      wAauthTitle(
                        title: 'Forget Password',
                        subtitle:
                            'Eneter your email and we\'ll send you a link \nto reset your password',
                      ),
                      _inputEmail(),
                      const SizedBox(
                        height: 30,
                      ),
                      _inputSubmit(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
