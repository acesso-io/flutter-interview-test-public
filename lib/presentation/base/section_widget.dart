import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';

class SectionWidget extends StatelessWidget {
  final String hint;
  final String? label;
  final Widget? extra;
  final void Function()? onTap;

  SectionWidget({
    required this.hint,
    this.label,
    this.onTap,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hint, style: Styles.hintLabel),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    label?.isNotEmpty == true ? label! : '-',
                    style: Styles.label,
                  ),
                ),
                if (extra != null) extra!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
