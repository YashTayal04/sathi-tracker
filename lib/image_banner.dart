import 'package:flutter/material.dart';


class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override

  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 0.22* MediaQuery.of(context).size.height,
        width: 0.22 * MediaQuery.of(context).size.width,
      ),
      child:Image.asset(
        _assetPath,
      )
    );
  }
}
