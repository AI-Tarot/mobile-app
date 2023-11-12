import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    Key? key,
  }) : super(key: key);

  final routeName = '/registration/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 24),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 0),
            const Text(
              'Welcome to the Tarot AI, where ancient wisdom meets modern AI. Unveil the secrets of the cosmos with our tarot readings.',
              style: TextStyle(fontSize: 24, fontFamily: 'Lora'),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to the next screen
              },
              child: const Text('Let the mystic journey begin!'),
            ),
          ],
        ),
      ),
    );
  }
}
