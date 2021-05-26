import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/colors.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';

class BaseScaffold extends StatelessWidget {
  final String? title;
  final Widget body;

  const BaseScaffold({
    Key? key,
    this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: body,
      );

  PreferredSizeWidget _buildAppBar() => AppBar(
        elevation: 4,
        backgroundColor: AppColors.elavatedItemColor,
        centerTitle: true,
        title: Text(
          title ?? '',
          style: Styles.title,
        ),
      );
}
