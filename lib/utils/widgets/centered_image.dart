import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CenteredImage extends StatelessWidget {
  const CenteredImage(
    this.url, {
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SvgPicture.asset(
        url,
        height: 200,
      ),
    );
  }
}
