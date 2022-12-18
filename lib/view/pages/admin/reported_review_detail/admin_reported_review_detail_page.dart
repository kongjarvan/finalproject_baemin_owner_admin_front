import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/admin_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/admin_resolve_review_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_detail/model/admin_reported_review_detail_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_detail/model/admin_reported_review_detail_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminReportedReviewDetailPage extends ConsumerStatefulWidget {
  const AdminReportedReviewDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminReportedReviewDetailPage> createState() => _ReportedReviewDetailPageState();
}

class _ReportedReviewDetailPageState extends ConsumerState<AdminReportedReviewDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _adminComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AdminReportedReviewDetailPageModel? model = ref.watch(adminReportedReviewDetailPageViewModel);
    return Scaffold(
      body: model == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(model),
    );
  }

  Padding _buildBody(AdminReportedReviewDetailPageModel? model) {
    return Padding(
      padding: const EdgeInsets.all(gap_l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: kWhiteColor,
            child: Padding(
              padding: const EdgeInsets.all(gap_m),
              child: Text('신고번호: ${model!.adminReportedReviewDetailRespDto.reportReviewId}', style: textTheme().headline1),
            ),
          ),
          const SizedBox(height: gap_l),
          Container(
            color: kWhiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: kBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(gap_m),
                    child: Text('신고사유: ${model.adminReportedReviewDetailRespDto.reason}', style: textTheme().headline1),
                  ),
                ),
                const Divider(thickness: 1, height: 1, color: kUnselectedListColor),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildReviewTextForm('신고자: ${model.adminReportedReviewDetailRespDto.nickname}', model.adminReportedReviewDetailRespDto.content),
                      const SizedBox(height: gap_xl),
                      _buildReviewTextForm('상대: ${model.adminReportedReviewDetailRespDto.storeName}', model.adminReportedReviewDetailRespDto.comment),
                      const SizedBox(height: gap_xl),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _adminComment,
                              maxLines: 1,
                              validator: (value) => value!.isEmpty ? "처리내용을 작성하세요" : null,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor, width: 2),
                                ),
                                hintText: "처리내용을 작성하세요",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: gap_s),
                          _buildRefuseButton('기각'),
                          const SizedBox(width: gap_s),
                          _buildResolveButton('처리', model.adminReportedReviewDetailRespDto.reportReviewId),
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
    );
  }

  InkWell _buildRefuseButton(String text) {
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
            text,
            style: const TextStyle(fontSize: 18, color: kUnselectedListColor, height: 1),
          ),
        ),
      ),
    );
  }

  InkWell _buildResolveButton(text, int reportReviewId) {
    return InkWell(
      key: _formKey,
      onTap: () async {
        AdminController adminCT = ref.read(adminController);
        AdminResolveReviewReqDto adminResolveReviewReqDto = AdminResolveReviewReqDto(adminComment: _adminComment.text.trim());
        await adminCT.resolveReview(adminResolveReviewReqDto, reportReviewId);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kMainColor),
          borderRadius: BorderRadius.circular(4),
          color: kMainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: kWhiteColor, height: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewTextForm(title, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: textTheme().headline1),
        const SizedBox(height: gap_m),
        Container(
          color: kBackgroundColor,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(gap_xs),
            child: Text(
              content,
              maxLines: 6,
              style: textTheme().bodyText1,
            ),
          ),
        ),
      ],
    );
  }
}
