import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/review_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/report_review_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/component/order_info.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/component/owner_comment.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/component/review_type_button.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewListPage extends ConsumerStatefulWidget {
  const ReviewListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReviewListPage> createState() => _ReviewListPageState();
}

class _ReviewListPageState extends ConsumerState<ReviewListPage> {
  bool? _isChecked = false;

  final _valueList1 = ['최신순', '별점순'];
  var _selectedValue1 = '최신순';

  final _valueList2 = ['명예훼손', '초상권침해', '상표권침해', '기타사유'];
  var _selectedValue2 = '명예훼손';
  @override
  Widget build(BuildContext context) {
    ReviewListPageModel? model = ref.watch(reviewListPageViewModel); // viewmodel 초기화
    ReviewListPageViewModel viewModel = ref.read(reviewListPageViewModel.notifier);
    return Scaffold(
      body: model == null ? const Center(child: CircularProgressIndicator()) : _buildBody(model),
    );
  }

  Widget _buildBody(ReviewListPageModel? model) {
    return Column(
      children: [
        const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '리뷰관리',
                  style: TextStyle(fontSize: 32),
                ),
                const SizedBox(height: gap_m),
                Row(
                  children: const [
                    ReviewTypeButton(text: '전체 리뷰', index: 3),
                    SizedBox(width: gap_s),
                    ReviewTypeButton(text: '신고된 리뷰', index: 4),
                  ],
                ),
                const SizedBox(height: gap_m),
                _buildReviewFilterForm(),
                const SizedBox(height: gap_m),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        model!.reviewListRespDtos.length,
                        (index) {
                          return _buildReview(model, index);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReview(ReviewListPageModel model, int index) {
    return Container(
      color: Colors.white,
      width: getBodyWidth(context),
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    for (int i = 0; i < model.reviewListRespDtos[index].starPoint; i++) const Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                    if (model.reviewListRespDtos[index].starPoint < 5)
                      for (int i = 0; i < 5 - model.reviewListRespDtos[index].starPoint; i++) const Icon(CupertinoIcons.star, color: kMainColor, size: 32),
                  ],
                ),
                _buildReportButton(index),
              ],
            ),
            const SizedBox(height: gap_m),
            SizedBox(
              width: getBodyWidth(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderInfo(index: index),
                  const SizedBox(width: gap_xl),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildUserReview(model, index),
                        const SizedBox(height: gap_m),
                        OwnerComment(index: index),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: gap_m),
            const Divider(thickness: 2)
          ],
        ),
      ),
    );
  }

  Widget _buildUserReview(ReviewListPageModel model, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('구매자 리뷰', style: TextStyle(fontSize: 20)),
        const SizedBox(height: gap_s),
        TextFormField(
          initialValue: model.reviewListRespDtos[index].customerContent,
          readOnly: true,
          maxLines: 3,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kMainColor, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  InkWell _buildReportButton(int index) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              titlePadding: const EdgeInsets.only(left: 120, right: 120, top: 60),
              title: const SizedBox(
                width: 300,
                child: Text(
                  '해당 리뷰를 신고할까요?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 32),
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: kUnselectedListColor),
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(4),
                    underline: Container(
                      height: 0,
                    ),
                    isExpanded: true,
                    value: _selectedValue2,
                    items: _valueList2.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: gap_s),
                            child: Text(value),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedValue2 = value as String;
                        },
                      );
                    },
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(gap_s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: kMainColor),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: gap_s),
                            child: Center(
                              child: Text(
                                '아니오',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 20,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          ReviewController reviewCT = ref.read(reviewController);
                          ReviewListPageModel? model = ref.watch(reviewListPageViewModel);
                          return InkWell(
                            onTap: () async {
                              ReportReviewReqDto reportReviewReqDto = ReportReviewReqDto(_selectedValue2);

                              await reviewCT.reportReview(reportReviewReqDto, model!.reviewListRespDtos[index].id);
                              Navigator.pop(context);
                              ref.read(reviewListPageViewModel.notifier).notifyViewModel();
                            },
                            child: Container(
                              width: 240,
                              decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: kMainColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: gap_s),
                                child: Center(
                                  child: Text(
                                    '네',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kUnselectedListColor, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_xs),
          child: Text(
            '신고하기',
            style: TextStyle(color: kUnselectedListColor, fontSize: 18),
          ),
        ),
      ),
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
                Text('미답변 리뷰만 확인하기', style: textTheme().headline1),
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
                  value: _selectedValue1,
                  items: _valueList1.map(
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
                      _selectedValue1 = value as String;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
