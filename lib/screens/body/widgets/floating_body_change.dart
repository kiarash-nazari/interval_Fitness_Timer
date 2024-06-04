import 'package:flutter/material.dart';

class FloatingBodyChange extends StatelessWidget {
  final bool front;
  final VoidCallback toggleBody;

  const FloatingBodyChange({
    Key? key,
    required this.front,
    required this.toggleBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: FloatingActionButton(
        onPressed: toggleBody,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: front ? const Text("Back body") : const Text("Front body"),
        ),
      ),
    );
  }
}
