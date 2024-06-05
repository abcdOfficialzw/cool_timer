import 'package:flutter/material.dart';

class PulsingRoundedIconButton extends StatefulWidget {
  const PulsingRoundedIconButton({
    //  required this.buttonText,

    this.isDisabled = false,
    super.key,
    required this.pulseColor,
    required this.buttonColor,
    required this.iconColor,
    required this.iconSize,
    required this.width,
    required this.height,
    required this.icon,
    this.onLongPressStarted,
    this.onLongPressEnded,
  });

  final Function(LongPressStartDetails)? onLongPressStarted;
  final Function(LongPressEndDetails)? onLongPressEnded;
  //final String buttonText;
  final bool isDisabled;
  final Color pulseColor;
  final Color buttonColor;
  final Color iconColor;
  final double iconSize;
  final double width;
  final double height;
  final IconData icon;

  @override
  State<PulsingRoundedIconButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<PulsingRoundedIconButton>
    with SingleTickerProviderStateMixin {
  bool isActive = false;
  bool isPulsing = false;

  void _handleTapDown(PointerDownEvent event) {
    setState(() {
      isActive = true;
      isPulsing = true;
    });
  }

  void _handleTapUp(PointerUpEvent event) {
    setState(() {
      isActive = false;
      isPulsing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: widget.onLongPressStarted,
      onLongPressEnd: widget.onLongPressEnded,
      child: Listener(
        onPointerDown: _handleTapDown,
        onPointerUp: _handleTapUp,
        child: Stack(
          children: [
            AnimatedScale(
              scale: isPulsing ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: AnimatedContainer(
                height: 100,
                width: 100,
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedScale(
              scale: isPulsing ? 1.65 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: AnimatedContainer(
                height: 100,
                width: 100,
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: widget.width,
              width: widget.height,
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: widget.buttonColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                color: widget.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
