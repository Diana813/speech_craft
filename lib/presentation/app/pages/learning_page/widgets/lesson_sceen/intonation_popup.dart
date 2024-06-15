import 'package:flutter/material.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../common/theme.dart';


void showIntonationPopup(
    context, List<double> lectorPitchData, List<double> userPitchData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppTheme.tale.shade300,
        title: const Text(intonation),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
          child: SfCartesianChart(
            legend:
            const Legend(isVisible: true, position: LegendPosition.bottom),
            primaryXAxis: const NumericAxis(
              title: AxisTitle(text: time),
            ),
            primaryYAxis: const NumericAxis(
              title: AxisTitle(text: pitch),
            ),
            series: <LineSeries<double, int>>[
              LineSeries<double, int>(
                name: lector,
                dataSource: lectorPitchData,
                xValueMapper: (double data, index) => index,
                yValueMapper: (double data, index) => data,
              ),
              LineSeries<double, int>(
                name: you,
                dataSource: userPitchData,
                xValueMapper: (double data, index) => index,
                yValueMapper: (double data, index) => data,
              ),
            ],
          ),
        ),
      );
    },
  );
}
