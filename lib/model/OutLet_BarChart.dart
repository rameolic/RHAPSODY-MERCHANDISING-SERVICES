import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:merchandising/api/monthlyvisitschart.dart';

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
          height: MediaQuery.of(context).size.height/4,
          child: SurveyChart(data: [
            ChartData(
              month: "JAN",
              visits: visits.jan,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "FEB",
              visits: visits.feb,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "MAR",
              visits: visits.mar,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "APR",
              visits: visits.apr,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "MAY",
              visits: visits.may,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "JUN",
              visits: visits.jun,
              barColor: charts.ColorUtil.fromDartColor(barcolor ),
            ),
            ChartData(
              month: "JUL",
              visits: visits.jul,
              barColor: charts.ColorUtil.fromDartColor(barcolor ),
            ),
            ChartData(
              month: "AUG",
              visits: visits.aug,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "SEP",
              visits: visits.sep,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "OCT",
              visits: visits.oct,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "NOV",
              visits: visits.nov,
              barColor: charts.ColorUtil.fromDartColor(barcolor),
            ),
            ChartData(
              month: "DEC",
              visits: visits.dec,
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
      elevation: 0,
      color: pink,
      child: ShaderMask(
        child: charts.BarChart(series, animate: true),
        shaderCallback: (Rect bounds){
          return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFB4B5B9),Color(0xFFF58426)]).createShader(bounds);
        },
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
