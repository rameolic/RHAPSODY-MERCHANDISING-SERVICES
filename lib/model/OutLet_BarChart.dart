import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../Constants.dart';

class BarChatData extends StatelessWidget {
  final barcolor = Colors.white;
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
              month: "JAN",
              visits: 8,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "FEB",
              visits: 6,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "MAR",
              visits: 12,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "APR",
              visits: 7,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "MAY",
              visits: 3,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "MAR",
              visits: 2,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "JUN",
              visits: 7,
              barColor: charts.ColorUtil.fromDartColor(barcolor ),
            ),
            ChartData(
              month: "AUG",
              visits: 11,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "SEP",
              visits: 9,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "OCT",
              visits: 12,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "NOV",
              visits: 5,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "DEC",
              visits: 7,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
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
        child: ShaderMask(
          child: charts.BarChart(series, animate: true),
          shaderCallback: (Rect bounds){
            return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFF58426),Color(0xFFB4B5B9)]).createShader(bounds);
          },
        )


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
