import 'package:flutter/material.dart';

class FragmentWidget extends StatelessWidget {
  Widget _widget;
  FragmentWidget(this._widget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget,
    );
  }
}