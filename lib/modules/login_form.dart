import 'package:flutter/material.dart';
import '../settings/theme.dart';
import '../settings/translations.dart';

import '../models/login_form_entry.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final Function onSaved;
  final entries = <String, String>{};

  LoginForm({Key? key, required this.onSaved}) : super(key: key);

  // gather all text fields and wrap into a map to give to onSaved callback
  void _saveForm() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();

      // map is populated by _onFieldSaved
      final loginInfo = LoginFormEntry(
        entries["username"] as String,
        entries["password"] as String,
      );

      onSaved(loginInfo);
    }
  }

  void _onFieldSaved(String label, String value) {
    entries[label] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Container(
        width: 480,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              T.labelTitleLogin,
              style: TextStyle(
                fontSize: AppStyles.titleFontSize,
                fontWeight: AppStyles.titleFontWeight,
              ),
            ),
            const StandardSpacer(),
            Text(
              T.labelLoginDisclaimer,
              style: TextStyle(
                color: AppStyles.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const StandardSpacer(multiplier: 2.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: T.labelUsernameHint,
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                final isValidEntry = value is String && value.isNotEmpty;
                return isValidEntry ? null : T.errorNoUsernameEntered;
              },
              onSaved: (value) {
                _onFieldSaved("username", value!.trim());
              },
            ),
            const StandardSpacer(),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: T.labelPasswordHint,
              ),
              textInputAction: TextInputAction.done,
              onEditingComplete: _saveForm,
              validator: (value) {
                final isValidEntry = value is String && value.isNotEmpty;
                return isValidEntry ? null : T.errorNoPasswordEntered;
              },
              onSaved: (value) {
                _onFieldSaved("password", value!.trim());
              },
            ),
            const StandardSpacer(),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Padding(
                padding: EdgeInsets.all(AppStyles.defaultInsetSize),
                child: Text(T.labelSubmit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
