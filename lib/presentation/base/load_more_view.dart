import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';

class LoadMoreView extends StatelessWidget {
  final Function() onPressed;

  const LoadMoreView({Key? key, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Load more',
          style: Styles.title,
        ),
      ),
    );
  }
}
