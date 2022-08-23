// // import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:deally_app/utils/colors-by-dii.dart';

// class RevenueSeries {
//   final String jour;
//   final double subscribers;
//   // final charts.Color barColor;

//   RevenueSeries(
//       {required this.jour, required this.subscribers, required this.barColor});
// }

// List<RevenueSeries> dataFirtsWeek = [
//   RevenueSeries(
//     jour: "lundi",
//     subscribers: 10,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "mardi",
//     subscribers: 11,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "mercredi",
//     subscribers: 12,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "jeudi",
//     subscribers: 10,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "vendredi",
//     subscribers: 8.5,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "samedi",
//     subscribers: 7.7,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "dimanche",
//     subscribers: 7.6,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
// ];

// List<RevenueSeries> dataSecondWeek = [
//   RevenueSeries(
//     jour: "lundi",
//     subscribers: 7.6,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "mardi",
//     subscribers: 11,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "mercredi",
//     subscribers: 8.5,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "jeudi",
//     subscribers: 10,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "vendredi",
//     subscribers: 12,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "samedi",
//     subscribers: 7.7,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
//   RevenueSeries(
//     jour: "dimanche",
//     subscribers: 10,
//     barColor: charts.ColorUtil.fromDartColor(meuveFonce),
//   ),
// ];

// List<charts.Series<RevenueSeries, String>> seriesFirst = [
//   charts.Series(
//       id: "Subscribers",
//       data: dataFirtsWeek,
//       domainFn: (RevenueSeries series, _) => series.jour,
//       measureFn: (RevenueSeries series, _) => series.subscribers,
//       colorFn: (RevenueSeries series, _) => series.barColor)
// ];

// List<charts.Series<RevenueSeries, String>> seriesSecond = [
//   charts.Series(
//       id: "Subscribers",
//       data: dataSecondWeek,
//       domainFn: (RevenueSeries series, _) => series.jour,
//       measureFn: (RevenueSeries series, _) => series.subscribers,
//       colorFn: (RevenueSeries series, _) => series.barColor)
// ];
