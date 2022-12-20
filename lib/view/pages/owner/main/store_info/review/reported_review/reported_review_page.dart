import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/component/review_type_button.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/reported_review/model/reported_review_list_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/reported_review/model/reported_review_list_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportedReviewPage extends ConsumerStatefulWidget {
  const ReportedReviewPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReportedReviewPage> createState() => _ReportedReviewPageState();
}

class _ReportedReviewPageState extends ConsumerState<ReportedReviewPage> {
  bool? _isChecked = false;
  final _valueList = ['최신순', '별점순'];
  var _selectedValue = '최신순';
  @override
  Widget build(BuildContext context) {
    ReportedReviewListPageModel? model = ref.watch(reportedReviewListPageViewModel); // viewmodel 초기화
    return Scaffold(
      body: model == null ? const Center(child: CircularProgressIndicator()) : _buildBody1(model),
    );
  }

  Column _buildBody1(ReportedReviewListPageModel model) {
    return Column(
      children: [
        Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '리뷰관리',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: gap_m),
                Row(
                  children: [
                    ReviewTypeButton(text: '전체 리뷰', index: 3),
                    SizedBox(width: gap_s),
                    ReviewTypeButton(text: '신고된 리뷰', index: 4),
                  ],
                ),
                SizedBox(height: gap_m),
                _buildReviewFilterForm(),
                SizedBox(height: gap_m),
                Expanded(
                  child: model.reportedReviewListRespDtos.length == 0
                      ? const Center(
                          child: Text(
                            '신고 된 리뷰가 없습니다.',
                            style: TextStyle(fontSize: 32, color: kMainColor, height: 1),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: List.generate(
                              model.reportedReviewListRespDtos.length,
                              (index) {
                                return _buildReportedReview(model, index);
                              },
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewFilterForm() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  activeColor: kMainColor,
                  checkColor: Colors.white,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text('답변된 리뷰만 확인하기', style: textTheme().headline1),
              ],
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kUnselectedListColor,
                ),
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: DropdownButton(
                  isExpanded: true,
                  style: textTheme().headline1,
                  underline: Container(
                    height: 0,
                  ),
                  value: _selectedValue,
                  items: _valueList.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: gap_xs),
                          child: Text(value),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as String;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportedReview(ReportedReviewListPageModel model, int index) {
    return Container(
      color: Colors.white,
      width: getBodyWidth(context),
      child: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('주문번호: ${model.reportedReviewListRespDtos[index].orderId}', style: TextStyle(fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < model.reportedReviewListRespDtos[index].starPoint; i++) const Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                    if (model.reportedReviewListRespDtos[index].starPoint < 5)
                      for (int i = 0; i < 5 - model.reportedReviewListRespDtos[index].starPoint; i++) const Icon(CupertinoIcons.star, color: kMainColor, size: 32),
                  ],
                ),
              ],
            ),
            SizedBox(height: gap_m),
            SizedBox(
              width: getBodyWidth(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSolution(model, index),
                ],
              ),
            ),
            SizedBox(height: gap_m),
            Divider(thickness: 2),
          ],
        ),
      ),
    );
  }

  Expanded _buildSolution(ReportedReviewListPageModel model, int index) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('처리내용', style: TextStyle(fontSize: 20)),
              SizedBox(height: gap_s),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kUnselectedListColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                height: getBodyHeight(context) * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: model.reportedReviewListRespDtos[index].adminComment == null
                      ? Center(
                          child: Text(
                            '해당 리뷰는 검토중입니다.',
                            style: TextStyle(color: kMainColor, fontSize: 24),
                          ),
                        )
                      : RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                          text: TextSpan(text: '${model.reportedReviewListRespDtos[index].adminComment}'),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
