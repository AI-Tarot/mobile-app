import 'package:flutter/material.dart';

class GridTileWidget extends StatefulWidget {
  final String text;
  final bool active;
  final Function onTap;

  const GridTileWidget({
    super.key,
    this.text = "",
    this.active = false,
    required this.onTap,
  });

  @override
  State<GridTileWidget> createState() => _GridTileWidgetState();
}

class _GridTileWidgetState extends State<GridTileWidget> {
  bool _highlighted = false;

  void _handleTap() {
    widget.onTap();
    setState(() {
      _highlighted = !_highlighted;
    });
  }

  @override
  Widget build(BuildContext context) {
    _highlighted = widget.active;

    Color backgroundColor = _highlighted
        ? const Color.fromARGB(255, 62, 62, 62)
        : const Color.fromARGB(255, 216, 220, 227);
    Color textColor = _highlighted
        ? const Color.fromARGB(255, 216, 220, 227)
        : const Color.fromARGB(255, 62, 62, 62);
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          height: 96,
          width: 96,
          child: Center(
              child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontSize: 12),
          )),
        ));
  }
}
