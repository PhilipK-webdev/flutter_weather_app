import 'package:flutter/material.dart';

class HandlerSubmit extends StatelessWidget {
  HandlerSubmit(
      {Key? key,
      this.active = false,
      required this.onPressed,
      required this.clearName})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onPressed;
  TextEditingController clearName = TextEditingController();
  void _handlerOnPressed() {
    onPressed(!active);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Submit'),
      onPressed: _handlerOnPressed,
    );
  }
}
