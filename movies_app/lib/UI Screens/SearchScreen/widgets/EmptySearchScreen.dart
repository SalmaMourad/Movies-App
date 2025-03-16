import 'package:flutter/material.dart';

class EmptySearchScreenWidget extends StatelessWidget {
  const EmptySearchScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('Assets/Images/EmptySearchScreen.png'),
        ],
      ),
    );
  }
}
