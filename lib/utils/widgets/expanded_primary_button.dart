import 'package:flutter/material.dart';

import '../constants/dimens.dart';

class ExpandedPrimaryButton extends StatelessWidget {
  const ExpandedPrimaryButton(
    this.text, {
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.onPressed,
  });
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                backgroundColor ?? Theme.of(context).colorScheme.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                        color: borderColor ??
                            Theme.of(context).colorScheme.primary)))),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(Dimens.padding.small),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
