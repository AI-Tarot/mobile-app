import 'package:flutter/material.dart';

class StepButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  const StepButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<StepButton> createState() => _StepButtonState();
}

class _StepButtonState extends State<StepButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          widget.disabled ? Colors.grey : Colors.black,
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 60),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      onPressed: widget.disabled ? null : widget.onPressed,
      child: Text(widget.label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    );
  }
}
