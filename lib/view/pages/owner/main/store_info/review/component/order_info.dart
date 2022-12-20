import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_model.dart';
import 'package:flutter/material.dart';

import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderInfo extends ConsumerWidget {
  final int index;
  const OrderInfo({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ReviewListPageModel? model = ref.watch(reviewListPageViewModel);

    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getBodyHeight(context) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.green,
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(index == 0 ? 'assets/리뷰사진.jpg' : 'assets/리뷰사진2.jpg', fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: gap_s),
          Text('주문번호: ${model!.reviewListRespDtos[index].orderId}', style: TextStyle(fontSize: 20)),
          SizedBox(height: gap_s),
          Text('주문일자: ${model.reviewListRespDtos[index].orderCreatedAt}', style: textTheme().bodyText2),
          SizedBox(height: gap_s),
          Text('공개여부: ${model.reviewListRespDtos[index].closure == false ? "공개" : "비공개"} ', style: textTheme().bodyText2),
        ],
      ),
    );
  }
}
