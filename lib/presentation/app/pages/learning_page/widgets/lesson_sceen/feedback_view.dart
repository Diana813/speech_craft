import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/small_sceen_upper_controls.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/text_popup.dart';
import 'package:speech_craft/presentation/common/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../common/strings.dart';
import '../../../../../../data/models/success_rate_response/user_success_rate.dart';
import 'accent_popup.dart';
import 'intonation_popup.dart';

class FeedbackView extends StatelessWidget {
  final UserSuccessRate userSuccessRate;

  const FeedbackView({super.key, required this.userSuccessRate});

  @override
  Widget build(BuildContext context) {
    List<CategorySuccessRate> userResponse = <CategorySuccessRate>[
      CategorySuccessRate(
          words, userSuccessRate.wordsAccuracy, AppTheme.successRateChartBlue),
      CategorySuccessRate(accent, userSuccessRate.accentAccuracy,
          AppTheme.successRateChartBrown),
      CategorySuccessRate(intonation, userSuccessRate.intonationAccuracy,
          AppTheme.successRateChartPink),
      CategorySuccessRate(pronunciation, userSuccessRate.pronunciationAccuracy,
          AppTheme.successRateChartOrange),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Visibility(
          visible: Breakpoints.small.isActive(context),
          child: const Expanded(
            flex: 1,
            child: SmallScreenUpperControls(),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.percentPattern(),
                minimum: 0,
                maximum: 1,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              series: <CartesianSeries<CategorySuccessRate, String>>[
                ColumnSeries<CategorySuccessRate, String>(
                  dataSource: userResponse,
                  xValueMapper: (CategorySuccessRate data, _) => data.category,
                  yValueMapper: (CategorySuccessRate data, _) => data.rate,
                  pointColorMapper: (CategorySuccessRate data, _) => data.color,
                  width: 0.4,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  onPointTap: (args) {
                    if (args.pointIndex == 0) {
                      showTextPopup(
                          context,
                          words,
                          '$lector${userSuccessRate.transcription.lectorTranscription}',
                          '$you${userSuccessRate.transcription.userTranscription}');
                    } else if (args.pointIndex == 1) {
                      showAccentDataPopup(context, userSuccessRate.accentData);
                    } else if (args.pointIndex == 2) {
                      showIntonationPopup(
                          context,
                          userSuccessRate.intonation.lectorIntonation,
                          userSuccessRate.intonation.userIntonation);
                    } else if (args.pointIndex == 3) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategorySuccessRate {
  final String category;
  final double rate;
  final Color color;

  CategorySuccessRate(this.category, this.rate, this.color);
}
