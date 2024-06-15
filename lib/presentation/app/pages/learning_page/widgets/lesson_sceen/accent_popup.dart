import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../common/strings.dart';
import '../../../../../../data/models/success_rate_response/accent.dart';


void showAccentDataPopup(BuildContext context, List<AccentData> accentData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(accentFeedback),
        content: SingleChildScrollView(
          child: Column(
            children:
            accentData.map((data) => _buildAccentDataItem(data)).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildAccentDataItem(AccentData data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(data.word, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      _buildChart(data.sampledAudioLector, lector),
      const SizedBox(height: 8),
      _buildChart(data.sampledAudioUser, you),
      const SizedBox(height: 16),
    ],
  );
}

Widget _buildChart(List<double> data, String title) {
  return SizedBox(
    height: 200,
    child: SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      title: ChartTitle(text: title),
      series: <LineSeries<double, int>>[
        LineSeries<double, int>(
          dataSource: data,
          xValueMapper: (double audio, index) => index,
          yValueMapper: (double audio, index) => audio,
        )
      ],
    ),
  );
}
