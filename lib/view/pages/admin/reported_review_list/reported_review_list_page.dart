import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/model/admin_main_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_list/model/admin_reported_review_list_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_list/model/admin_reported_review_list_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportedReviewListPage extends ConsumerStatefulWidget {
  const ReportedReviewListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReportedReviewListPage> createState() => _ReportedReviewListPageState();
}

class _ReportedReviewListPageState extends ConsumerState<ReportedReviewListPage> {
  final _valueList1 = ['신고자유형순', '유저아이디순'];
  var _selectedValue1 = '신고자유형순';

  final _valueList2 = ['신고사유순', '처리유무'];
  var _selectedValue2 = '신고사유순';

  @override
  Widget build(BuildContext context) {
    AdminReportedReviewListPageModel? model = ref.watch(adminReportedReviewListPageViewModel);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(gap_m),
                child: Text('총 99명이 가입신청을 했어요', style: textTheme().headline1),
              ),
            ),
            const SizedBox(height: gap_l),
            _buildReportedReviewList(),
          ],
        ),
      ),
    );
  }

  Flexible _buildReportedReviewList() {
    return Flexible(
      child: Container(
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(gap_xl),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  const SizedBox(width: gap_s),
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
                        value: _selectedValue2,
                        items: _valueList2.map(
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
                            _selectedValue2 = value as String;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(height: gap_l),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                },
                children: <TableRow>[
                  TableRow(
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: 32,
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('번호', style: textTheme().headline1),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('신고자 유형', style: textTheme().headline1),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('유저 아이디', style: textTheme().headline1),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('신고사유', style: textTheme().headline1),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('처리유무', style: textTheme().headline1),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                      4: FlexColumnWidth(),
                    },
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  AdminReportedReviewListPageModel? model = ref.watch(adminReportedReviewListPageViewModel);
                  return model == null
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: List.generate(
                            model.adminReportedReviewListRespDtos.length,
                            (index) {
                              return _buildReportedReview(ref, model, index);
                            },
                          ),
                        );
                },
              ),

              // Consumer(
              //   builder: (context, ref, child) {
              //     AdminReportedReviewListPageModel? model = ref.watch(adminReportedReviewListPageViewModel);
              //     return Flexible(
              //       child: SingleChildScrollView(
              //         scrollDirection: Axis.vertical,
              //         child: Table(
              //           defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //           border: TableBorder.all(),
              //           columnWidths: const <int, TableColumnWidth>{
              //             0: FlexColumnWidth(),
              //             1: FlexColumnWidth(),
              //             2: FlexColumnWidth(),
              //             3: FlexColumnWidth(),
              //             4: FlexColumnWidth(),
              //           },
              //           children: <TableRow>[asdf(ref)],
              //         ),
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportedReview(WidgetRef ref, AdminReportedReviewListPageModel model, int index) {
    return SizedBox(
      height: 32,
      child: InkWell(
        onTap: () {
          ref.read(adminMainPageViewModel.notifier).moveToReviewDetailPage(index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
                child: Center(child: Text('${model.adminReportedReviewListRespDtos[index].id}')),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
                child: Center(child: Text('${model.adminReportedReviewListRespDtos[index].role}')),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
                child: Center(child: Text('${model.adminReportedReviewListRespDtos[index].username}')),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
                child: Center(child: Text('${model.adminReportedReviewListRespDtos[index].reason}')),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
                child: Center(child: Text(model.adminReportedReviewListRespDtos[index].isResolved == false ? '처리 대기중' : '처리완료')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TableRow _buildReportedReview(int index) {
  //   return TableRow(
  //     decoration: const BoxDecoration(
  //       color: kWhiteColor,
  //     ),
  //     children: <Widget>[
  //       InkWell(
  //         onTap: ref.read(adminMainPageViewModel.notifier).changeIndex(index),
  //         child: SizedBox(
  //           height: 32,
  //           child: Align(
  //             alignment: AlignmentDirectional.center,
  //             child: Text('1', style: textTheme().headline1),
  //           ),
  //         ),
  //       ),
  //       InkWell(
  //         onTap: ref.read(adminMainPageViewModel.notifier).changeIndex(index),
  //         child: Align(
  //           alignment: AlignmentDirectional.center,
  //           child: Text('사업자', style: textTheme().headline1),
  //         ),
  //       ),
  //       InkWell(
  //         onTap: ref.read(adminMainPageViewModel.notifier).changeIndex(index),
  //         child: Align(
  //           alignment: AlignmentDirectional.center,
  //           child: Text('cs123', style: textTheme().headline1),
  //         ),
  //       ),
  //       InkWell(
  //         onTap: ref.read(adminMainPageViewModel.notifier).changeIndex(index),
  //         child: Align(
  //           alignment: AlignmentDirectional.center,
  //           child: Text('욕설', style: textTheme().headline1),
  //         ),
  //       ),
  //       InkWell(
  //         onTap: ref.read(adminMainPageViewModel.notifier).changeIndex(index),
  //         child: Align(
  //           alignment: AlignmentDirectional.center,
  //           child: Text('처리완료', style: textTheme().headline1),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
