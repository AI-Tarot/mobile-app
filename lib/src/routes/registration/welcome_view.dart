import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:ai_tarot/src/components/step_button.dart';

class WelcomeView extends StatelessWidget {
  final routeName = '/registration/welcome';

  const WelcomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 54),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 0),
            Text(
              t.welcomeMessage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            StepButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registration/goals');
              },
              label: t.welcomeButtonLabel,
            ),
          ],
        ),
      ),
    );
  }
}
