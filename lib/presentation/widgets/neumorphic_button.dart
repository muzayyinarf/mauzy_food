import 'package:flutter/material.dart';

class NeumorphicButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const NeumorphicButton({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
          boxShadow: isPressed
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 6.0,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 6.0,
                  ),
                ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          child: widget.child,
        ),
      ),
    );
  }
}
