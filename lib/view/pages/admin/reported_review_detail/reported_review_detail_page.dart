import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class ReportedReviewDetailPage extends StatefulWidget {
  const ReportedReviewDetailPage({Key? key}) : super(key: key);

  @override
  State<ReportedReviewDetailPage> createState() => _ReportedReviewDetailPageState();
}

class _ReportedReviewDetailPageState extends State<ReportedReviewDetailPage> {
  @override
  Widget build(BuildContext context) {
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
                child: Text('신고번호: 99', style: textTheme().headline1),
              ),
            ),
            SizedBox(height: gap_l),
            Container(
              color: kWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: kBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: Text('신고사유: 욕설', style: textTheme().headline1),
                    ),
                  ),
                  Divider(thickness: 1, height: 1, color: kUnselectedListColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildReviewTextForm('신고자: jinsa(일반회원)', '어쩌고저쩌고'),
                        SizedBox(height: gap_xl),
                        _buildReviewTextForm('상대: cs123(사업자회원)', '어쩌고저쩌고'),
                        SizedBox(height: gap_xl),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                maxLines: 1,
                                validator: (value) => value!.isEmpty ? "처리내용을 작성하세요" : null,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor, width: 2),
                                  ),
                                  hintText: "처리내용을 작성하세요",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: gap_s),
                            _buildRefuseButton('기각'),
                            SizedBox(width: gap_s),
                            _buildResolveButton('처리'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildRefuseButton(text) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kUnselectedListColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            '${text}',
            style: TextStyle(fontSize: 18, color: kUnselectedListColor, height: 1),
          ),
        ),
      ),
    );
  }

  InkWell _buildResolveButton(text) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kMainColor),
          borderRadius: BorderRadius.circular(4),
          color: kMainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            '${text}',
            style: TextStyle(fontSize: 18, color: kWhiteColor, height: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewTextForm(title, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('${title}', style: textTheme().headline1),
        SizedBox(height: gap_m),
        Container(
          color: kBackgroundColor,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(gap_xs),
            child: Text(
              '${content}',
              maxLines: 6,
              style: textTheme().bodyText1,
            ),
          ),
        ),
      ],
    );
  }
}
