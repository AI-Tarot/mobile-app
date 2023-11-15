import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:ai_tarot/src/components/step_button.dart';

const List<String> statuses = [
  'Explore my spiritual journey',
  'Seek deeper love and fulfilling relationships',
  'Aspire to excel in my career',
  'Enhance my physical and mental well-being',
  'Yearn to discover my true self',
  'Strive for financial stability and prosperity',
  'Strive for financial stability and prosperity',
];

class GoalsView extends StatefulWidget {
  final routeName = '/registration/goals';

  const GoalsView({
    Key? key,
  }) : super(key: key);

  @override
  State<GoalsView> createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  final Set<int> _selectedIndexes = {};

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
              'Unveil the Magic of Your Future',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Let Tarot Determine Your Goals and Desires',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            _buildList(),
            StepButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/registration/relationship_status');
              },
              label: 'Next',
              disabled: _selectedIndexes.isEmpty,
            ),
          ],
        ),
      ),
    );
  }

  void _handleCheckbox(bool? status, int index) {
    setState(() {
      if (status == true) {
        _selectedIndexes.add(index);
      } else {
        _selectedIndexes.remove(index);
      }
    });
  }

  Widget _buildList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 26, bottom: 26),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 12),
          itemCount: statuses.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              child: CheckboxListTile(
                value: _selectedIndexes.contains(index),
                title: Text(statuses[index]),
                onChanged: (status) => {_handleCheckbox(status, index)},
                tileColor: const Color.fromARGB(255, 216, 220, 227),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
