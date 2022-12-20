import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewTypeButton extends StatefulWidget {
  final String text;
  final int index;
  const ReviewTypeButton({required this.text, required this.index, Key? key}) : super(key: key);

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
        child: Consumer(
          builder: (context, ref, child) {
            StoreInfoPageModel? model = ref.watch(storeInfoPageViewModel);
            return InkWell(
              onTap: () async {
                ref.read(storeInfoPageViewModel.notifier).changeIndex(widget.index);
              },
              child: Padding(
                padding: const EdgeInsets.all(gap_m),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: 20, color: kUnselectedListColor),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
