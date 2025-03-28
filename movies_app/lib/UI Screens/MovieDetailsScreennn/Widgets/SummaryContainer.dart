import 'package:flutter/material.dart';

class SummaryContainer extends StatelessWidget {
  final String? summaryText;
  SummaryContainer({
    super.key,
    this.summaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                textAlign: TextAlign.start,
                'Summary',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            summaryText ?? '',
            maxLines: 15,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
