import 'package:flutter/material.dart';

import 'package:ai_tarot/src/components/grid_tile.dart';
import 'package:ai_tarot/src/components/step_button.dart';

const List<String> statuses = [
  'Money',
  'Love',
  'Family',
  'Career',
  'Health',
  'Education',
  'Hobbies',
  'Travel',
  'Personal Growth',
];

class InterestsView extends StatefulWidget {
  final routeName = '/registration/interests';

  const InterestsView({
    Key? key,
  }) : super(key: key);

  @override
  State<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends State<InterestsView> {
  int _selectedIndex = -1;

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
              'Interests',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const Text(
              'What interests you the most in your life?',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            _buildGrid(),
            StepButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registration/spirit_animal');
              },
              label: 'Next',
              disabled: _selectedIndex == -1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 11,
          mainAxisSpacing: 11,
        ),
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return GridTileWidget(
            text: statuses[index],
            active: _selectedIndex == index,
            onTap: () => {
              setState(() {
                _selectedIndex = index;
              })
            },
          );
        },
      ),
    );
  }
}
