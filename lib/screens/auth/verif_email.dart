import 'package:flutter/material.dart';
import 'package:flutter_e_wallet/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class VerifEmail extends StatefulWidget {
  const VerifEmail({Key? key}) : super(key: key);

  @override
  State<VerifEmail> createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _resendEmailButton() {
    return Column(
      children: <Widget>[
        const Text(
          'Did\'t receive an email ?',
        ),
        FlatButton(
          child: Text(
            _isLoading ? 'Sending' : 'Resend',
          ),
          onPressed: () async {
            setState(() => _isLoading = true);
            final auth = Provider.of<AuthProvider>(context, listen: false);
            await auth.resendEmailVerif();
            setState(() {
              _isLoading = false;
              _isSended = true;
            });
          },
        ),
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
      child: const Text(
        'Email Sended',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _bottomWidget() {
    return _isSended ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.drag_handle,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.alternate_email,
                  size: 50,
                ),
                const Text(
                  'Verify your email',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'We have send an email with a confirmation link\n to your email address.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                const Text(
                  'Please clik on that verify your email\n and continue the rgistration process',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Divider(
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                _bottomWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
