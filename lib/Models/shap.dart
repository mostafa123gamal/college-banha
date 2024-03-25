import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  final List<Box> boxes;

  Shape({required this.boxes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: boxes.map((box) => _buildBox(box)).toList(),
    );
  }

  Widget _buildBox(Box box) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      child: Text(box.text),
    );
  }
}

class Box {
  final String text;

  Box({required this.text});
}