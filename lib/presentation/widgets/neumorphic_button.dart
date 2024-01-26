import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';

class NeumorphicButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const NeumorphicButton({super.key, required this.onTap, required this.child});

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
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
          color: isDarkMode ? backgroundDarkModeColor : backgroundColor,
          boxShadow: isPressed
              ? null
              : [
                  BoxShadow(
                    color: isDarkMode
                        ? shadow2DarkModeColor
                        : Colors.grey.shade300,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 6.0,
                  ),
                  BoxShadow(
                    color: isDarkMode ? shadow1DarkModeColor : Colors.white,
                    offset: const Offset(-4.0, -4.0),
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
