import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/base/view_state.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ViewState state = IdleState();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
