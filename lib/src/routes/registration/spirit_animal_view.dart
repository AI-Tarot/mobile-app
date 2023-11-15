import 'package:flutter/material.dart';

import 'package:ai_tarot/src/components/step_button.dart';

class SpiritAnimalView extends StatefulWidget {
  final routeName = '/registration/spirit_animal';

  const SpiritAnimalView({
    Key? key,
  }) : super(key: key);

  @override
  State<SpiritAnimalView> createState() => _SpiritAnimalViewState();
}

class _SpiritAnimalViewState extends State<SpiritAnimalView> {
  String _spiritAnimalText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 54),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Spirit Animal',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 96),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0, color: Colors.transparent),
                color: const Color.fromARGB(255, 216, 220, 227),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _spiritAnimalText = value;
                  });
                },
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  hintText: 'Enter your spirit animal',
                  border: InputBorder.none,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            StepButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registration/birth_date');
              },
              label: 'Next',
              disabled: _spiritAnimalText.isEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
