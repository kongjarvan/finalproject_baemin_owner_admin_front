import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/review_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/insert_ceo_comment_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerComment extends StatelessWidget {
  final index;
  const OwnerComment({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final _ceoContent = TextEditingController();
    return Column(
      key: formKey,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('사장님 답글', style: TextStyle(fontSize: 20)),
            SizedBox(height: gap_s),
            TextFormField(
              controller: _ceoContent,
              maxLines: 7,
              validator: (value) => value!.isEmpty ? "사장님 댓글을 입력 해 주세요" : null,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kMainColor, width: 2),
                ),
                hintText: "사장님 답글 입력",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: gap_m),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => StatefulBuilder(
                builder: (context, setState) => AlertDialog(
                  titlePadding: EdgeInsets.only(left: 120, right: 120, top: 60),
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      '답변을 작성할까요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kMainColor, fontSize: 32),
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: gap_s),
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
                                  InsertCeoCommentReqDto insertCeoCommentReqDto = InsertCeoCommentReqDto(content: _ceoContent.text.trim());

                                  await reviewCT.insertCeoComment(insertCeoCommentReqDto, model!.reviewListRespDtos[index].id);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 240,
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: kMainColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: gap_s),
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
            width: getBodyWidth(context) * 0.15,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kMainColor),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(child: Text('작성하기', style: textTheme().headline3)),
            ),
          ),
        ),
      ],
    );
  }
}
