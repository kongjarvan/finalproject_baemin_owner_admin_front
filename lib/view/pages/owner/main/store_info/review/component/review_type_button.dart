import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:flutter/material.dart';

class ReviewTypeButton extends StatefulWidget {
  final Function(int index) notifyParent;
  final int index;
  final String text;
  const ReviewTypeButton({
    required this.notifyParent,
    required this.index,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewTypeButton> createState() => _ReviewTypeButtonState();
}

class _ReviewTypeButtonState extends State<ReviewTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: InkWell(
          onTap: () => callback(widget.index),
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Center(
              child: Text(
                '${widget.text}',
                style: TextStyle(fontSize: 20, color: kUnselectedListColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void callback(int index) {
    widget.notifyParent(index);
  }
}
