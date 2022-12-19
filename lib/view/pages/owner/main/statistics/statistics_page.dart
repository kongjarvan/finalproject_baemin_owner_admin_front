import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/core/util/my_format.dart';
import 'package:baemin_owner_admin_front/dto/req/statistics_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/statistics/model/statistics__page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/statistics/model/statistics_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class StatisticsPage extends ConsumerStatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StatisticsPage> createState() => _StatisticsPageState();
}

DateTime focusedDay = DateTime.now();

DateTime selectedDay1 = DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
);

DateTime selectedDay2 = DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
);

class _StatisticsPageState extends ConsumerState<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        body: SizedBox(
          width: getBodyWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(gap_l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '통계',
                        style: TextStyle(color: kMainColor, fontSize: 32, height: 1),
                      ),
                      const SizedBox(height: gap_m),
                      _buildDateFilter(),
                      const SizedBox(height: gap_m),
                      _buildIncome(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncome() {
    StatisticsPageModel? model = ref.watch(statisticsPageViewModel);
    return model == null
        ? const Center(child: Text('날짜를 선택해 주세요', style: TextStyle(color: kMainColor, fontSize: 24)))
        : Column(
            children: [
              _buildTotalIncome(model),
              const SizedBox(height: gap_m),
              _buildIncomeDetail(model),
            ],
          );
  }

  Row _buildIncomeDetail(StatisticsPageModel model) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Row(
                    children: const [
                      Icon(CupertinoIcons.doc_text),
                      SizedBox(width: gap_s),
                      Text('배달', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
                    ],
                  ),
                ),
                const Divider(thickness: gap_xs, height: gap_xs, color: kBackgroundColor),
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputIncomeFormField(model.statisticsRespDto.deliveryCount, model.statisticsRespDto.deliveryAmount, 0.05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: gap_s),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Row(
                    children: const [
                      Icon(CupertinoIcons.doc_text),
                      SizedBox(width: gap_s),
                      Text('포장', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
                    ],
                  ),
                ),
                const Divider(thickness: gap_xs, height: gap_xs, color: kBackgroundColor),
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputIncomeFormField(model.statisticsRespDto.takeOutCount, model.statisticsRespDto.takeOutAmount, 0.05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _buildTotalIncome(StatisticsPageModel model) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: const [
                Icon(CupertinoIcons.doc_text),
                SizedBox(width: gap_s),
                Text('총 수입', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
              ],
            ),
          ),
          const Divider(thickness: gap_xs, height: gap_xs, color: kBackgroundColor),
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: _buildInputIncomeFormField(model.statisticsRespDto.orderCount, model.statisticsRespDto.orderAmount, 0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildInputIncomeFormField(int orderCount, income, gap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('총 주문 $orderCount건', style: const TextStyle(fontSize: 24, color: Colors.black, height: 1)),
        const SizedBox(height: gap_m),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('주문금액', style: textTheme().headline1),
            const SizedBox(height: gap_m),
            Text(numberPriceFormat('${income ?? 0}'), style: const TextStyle(fontSize: 32, color: kMainColor, height: 1)),
          ],
        )
      ],
    );
  }

  Container _buildDateFilter() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('기간', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
            const SizedBox(height: gap_s),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildPeriodButton('일간'),
                    const SizedBox(width: gap_s),
                    _buildPeriodButton('주간'),
                    const SizedBox(width: gap_s),
                    _buildPeriodButton('월간'),
                    const SizedBox(width: 80),
                    Row(
                      children: [
                        _buildDateButton1(),
                        const SizedBox(width: gap_m),
                        const Text('~'),
                        const SizedBox(width: gap_m),
                        _buildDateButton2(),
                      ],
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    OwnerController ownerCT = ref.read(ownerController);
                    return InkWell(
                      onTap: () async {
                        String startTime = DateFormat('yyyy-MM-dd').format(selectedDay1);
                        String endTime = DateFormat('yyyy-MM-dd').format(selectedDay2);
                        StatisticsReqDto statisticsReqDto = StatisticsReqDto(startTime: startTime, endTime: endTime);
                        await ref.read(statisticsPageViewModel.notifier).notifyViewModel(statisticsReqDto);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kMainColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80, vertical: gap_xs),
                          child: Text(
                            '조회하기',
                            style: TextStyle(color: kMainColor, fontSize: 24, height: 1),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton1() {
    return InkWell(
      onTap: () {
        showDatePickerPop1();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kUnselectedListColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            children: [
              Text(
                DateFormat('yy/MM/dd').format(selectedDay1),
                style: const TextStyle(color: kUnselectedListColor, fontSize: 18, height: 1),
              ),
              const SizedBox(width: 60),
              const Icon(
                CupertinoIcons.arrowtriangle_down_fill,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateButton2() {
    return InkWell(
      onTap: () {
        showDatePickerPop2();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kUnselectedListColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            children: [
              Text(
                DateFormat('yy/MM/dd').format(selectedDay2),
                style: const TextStyle(color: kUnselectedListColor, fontSize: 18, height: 1),
              ),
              const SizedBox(width: 60),
              const Icon(
                CupertinoIcons.arrowtriangle_down_fill,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodButton(text) {
    return Consumer(
      builder: (context, ref, child) {
        OwnerController ownerCT = ref.read(ownerController);
        return InkWell(
          onTap: () async {
            String startTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
            String endTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
            StatisticsReqDto statisticsReqDto = StatisticsReqDto(startTime: startTime, endTime: endTime);
            await ref.read(statisticsPageViewModel.notifier).notifyViewModel(statisticsReqDto);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: kUnselectedListColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: gap_xs),
              child: Text(
                '$text',
                style: const TextStyle(color: kUnselectedListColor, fontSize: 24, height: 1),
              ),
            ),
          ),
        );
      },
    );
  }

  void showDatePickerPop1() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      currentDate: selectedDay1,
      initialDate: selectedDay1, //초기값
      firstDate: DateTime(2000), //시작일
      lastDate: DateTime(2099), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.deepOrange),
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((dateTime) {
      setState(() {
        selectedDay1 = dateTime!;
      });
    });
  }

  void showDatePickerPop2() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      currentDate: selectedDay2,
      initialDate: selectedDay2, //초기값
      firstDate: DateTime(2000), //시작일
      lastDate: DateTime(2099), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.deepOrange),
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((dateTime) {
      setState(() {
        selectedDay2 = dateTime!;
      });
    });
  }
}
