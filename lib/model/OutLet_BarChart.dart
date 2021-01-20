import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../Constants.dart';

class BarChatData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Monthly No. of Visits",
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: orange),
        ),
        Container(
          height: 230,
          child: SurveyChart(data: [
            ChartData(
              month: "  JUL  ",
              visits: 1,
              barColor: charts.ColorUtil.fromDartColor(orange ),
            ),
            ChartData(
              month: " AUG  ",
              visits: 1,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " SEP  ",
              visits: 1,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " OCT  ",
              visits: 2,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " NOV  ",
              visits: 4,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " DEC  ",
              visits: 3,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " JAN  ",
              visits: 2,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " FEB  ",
              visits: 2,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),
            ChartData(
              month: " MAR  ",
              visits: 2,
              barColor: charts.ColorUtil.fromDartColor(orange),
            ),

          ],),
        ),
      ],
    );
  }
}





class Task {
  String task;
  String taskValue;
  Color colour;

  Task(this.colour, this.task, this.taskValue);
}

class SurveyChart extends StatelessWidget {
  final List<ChartData> data;

  SurveyChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (ChartData series, _) => series.month,
          measureFn: (ChartData series, _) => series.visits,
          colorFn: (ChartData series, _) => series.barColor),
    ];
    return Card(
      color: pink,
      child: Expanded(
        child: charts.BarChart(series, animate: true),
      ),
    );
  }
}

class ChartData {
  final String month;
  final int visits;
  final charts.Color barColor;

  ChartData(
      {@required this.month, @required this.visits, @required this.barColor});
}
