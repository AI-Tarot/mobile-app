import 'dart:async';
import 'package:flutter/material.dart';

class InitializationView extends StatelessWidget {
  final routeName = '/';

  const InitializationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, '/registration/welcome'),
    );

    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 24, bottom: 24),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 0,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 0,
            ),
            Text(
              'AI Tarot',
              style: TextStyle(
                  fontSize: 24,
                  backgroundColor: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: double.infinity,
              height: 0,
            ),
            CircularProgressIndicator(),
            SizedBox(
              width: double.infinity,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
