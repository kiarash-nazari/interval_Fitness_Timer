import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';

class ExerciseBox extends StatefulWidget {
  ExerciseBox({
    super.key,
    required this.borderColor,
    required this.children,
    required this.size,
    required this.header,
    required this.visible,
  });

  final Size size;
  final String header;
  bool visible;
  final List<Widget> children;
  final Color borderColor;

  @override
  State<ExerciseBox> createState() => _ExerciseBoxState();
}

class _ExerciseBoxState extends State<ExerciseBox> {
  double h = 50;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(10),
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      width: widget.size.width / 1.1,
      height: h,
      child: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            widget.visible = !widget.visible;
            h = widget.visible ? 350 : 50;
          }),
          child: Glassmorphism(
              borderColor: widget.borderColor,
              blur: .2,
              opacity: .2,
              radius: 20,
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      widget.header,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      visible: widget.visible,
                      child: Column(
                        children: widget.children,
                      ),
                    ),
                  ],
                ),
              ))),
        ),
      ),
    );
  }
}
