import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryTab({required this.title, this.isSelected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      // width: 104,
      margin: EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber, width: 2),
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
