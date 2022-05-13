import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../providers/authentication.dart';
import '../services/data_service.dart';
import '../services/login_service.dart';
import '../settings/theme.dart';
import '../settings/translations.dart';
import '../models/login_form_entry.dart';
import '../modules/login_form.dart';

enum ToastType { success, failed, hidden }

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isWaitingOnAuth = false;
  bool _authWasSuccessful = false;
  ToastType _toast = ToastType.hidden; // "success", "failed"
  // fixme: confgiure this toast message!!

  Future<bool?> handleAuthentication(
      BuildContext context, LoginFormEntry userInfo) async {
    setState(() {
      _isWaitingOnAuth = true;
    });

    final resData = await postAuthentication(userInfo);
    final authState = context.read<AuthenticationProvider>();

    if (resData?.forward.body['authcode'].runtimeType == String) {
      authState.onLoginSuccessful();
      setState(() {
        _authWasSuccessful = true;
      });
      Navigator.pop(context);
    }

    setState(() {
      _isWaitingOnAuth = false;
    });
    return resData != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(T.labelTitleLogin),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppStyles.appInsetMargin),
            child: _isWaitingOnAuth
                ? const Text(
                    T.labelConnectingToIRacing,
                  )
                : LoginForm(
                    onSaved: (LoginFormEntry entry) {
                      handleAuthentication(context, entry);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
