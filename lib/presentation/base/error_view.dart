import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text(
        'Ocorreu um erro!\nTente novamente mais tarde',
        style: Styles.appBar,
      );
}
