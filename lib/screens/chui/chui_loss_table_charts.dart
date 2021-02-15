import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChuiLossTableCharts extends StatelessWidget {

  final model;
  ChuiLossTableCharts({this.model});

  @override
  Widget build(BuildContext context) {
    final index_of = model.columns.indexOf('Внешняя-Внутреняя');
    List<String> values = [];
    for (var i in model.rows) {
      values.add(i[index_of]);
    }
    final set = values.toSet();
    Map<String, int> m = new Map();
    set.forEach((element) {
      m[element] = 0;
    });
    values.forEach((val) {
      set.forEach((s) {
        if (s == val) {
          m[s] += 1;
        }
      });
    });
    print(m);
    var index = 0;
    final C = [Colors.brown, Colors.amberAccent];
    return PieChart(
        PieChartData(
            centerSpaceRadius: 50.0,
            sections: m.entries.map((entry) {
              final w = PieChartSectionData(
                value: entry.value.toDouble(),
                showTitle: true,
                title: entry.key,
                color: C[index],
              );
              index += 1;
              return w;
            }).toList())
    );
  }
}
