import 'package:flutter/material.dart';

import 'package:ai_tarot/src/components/step_button.dart';

class BirthDateView extends StatefulWidget {
  final routeName = '/registration/birth_date';

  const BirthDateView({
    Key? key,
  }) : super(key: key);

  @override
  State<BirthDateView> createState() => _BirthDateViewState();
}

class _BirthDateViewState extends State<BirthDateView> {
  DateTime? _selectedDate;
  DateTime? _selectedTime;

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
              'Birth date and time',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 96),
            _buildDate(),
            const SizedBox(height: 40),
            _buildTime(),
            const Expanded(child: SizedBox()),
            StepButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              label: 'Next',
              disabled: _selectedDate == null || _selectedTime == null,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildDate() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0, color: Colors.transparent),
        color: const Color.fromARGB(255, 216, 220, 227),
      ),
      child: TextButton(
        onPressed: _selectDate,
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 120)),
        ),
        child: Text(
          _selectedDate == null
              ? 'Select date'
              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = DateTime(
          _selectedDate!.year,
          _selectedDate!.month,
          _selectedDate!.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  Widget _buildTime() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0, color: Colors.transparent),
        color: const Color.fromARGB(255, 216, 220, 227),
      ),
      child: TextButton(
        onPressed: _selectTime,
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 120)),
        ),
        child: Text(
          _selectedTime == null
              ? 'Select time'
              : '${_selectedTime!.hour}:${_selectedTime!.minute}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
