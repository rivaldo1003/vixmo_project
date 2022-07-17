import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

class BatteryGraphicConsumption extends StatefulWidget {
  @override
  State<BatteryGraphicConsumption> createState() => _BatteryGraphicConsumptionState();
}

class _BatteryGraphicConsumptionState extends State<BatteryGraphicConsumption> {
  final List<Color> gradientColors = [
    const Color(0xff3174FB),
    Colors.white,
    // const Color(0xff3174FB),
  ];

  final String font = 'SanFrancisco';
  bool showAvg = false;

  // bool isWeekly = true;
  // bool isMonthly = false;
  // bool isYearly = false;
  //
  // void clickWeekly() {
  //   setState(() {
  //     isWeekly = true;
  //     isMonthly = false;
  //     isYearly = false;
  //   });
  // }
  //
  // void clickMonthly() {
  //   setState(() {
  //     isWeekly = false;
  //     isMonthly = true;
  //     isYearly = false;
  //   });
  // }
  //
  // void clickYearly() {
  //   setState(() {
  //     isWeekly = false;
  //     isMonthly = false;
  //     isYearly = true;
  //   });
  // }

  int groupValue = 0;

  String dropdownvalue = 'Weekly';
  var items = [
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12,
                left: 12,
                top: 12,
                bottom: 0,
              ),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12,
              top: 0,
              right: 12,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 32,
                  width: 82,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F8FA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: blackColor,
                      ),
                      elevation: 1,
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownvalue,
                      style: TextStyle(
                        fontFamily: font,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: blackColor,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.w400,
      color: Color(0xff111619),
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 4:
        text = const Text('Tue', style: style);
        break;
      case 6:
        text = const Text('Wed', style: style);
        break;
      case 8:
        text = const Text('Thu', style: style);
        break;
      case 10:
        text = const Text('Wed', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.w400,
      color: Color(0xff111619),
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 1:
        text = '20%';
        break;
      case 2:
        text = '40%';
        break;
      case 3:
        text = '60%';
        break;
      case 4:
        text = '80%';
        break;
      case 5:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xffE2EBEC),
            strokeWidth: 0.2,
          );
        },
        // getDrawingVerticalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 4),
            FlSpot(0.3, 3.4),
            FlSpot(0.4, 3.6),
            FlSpot(0.5, 3.8),
            FlSpot(0.7, 4.2),
            FlSpot(0.8, 3.5),
            FlSpot(1.5, 5),
            FlSpot(1.7, 5),
            FlSpot(1.8, 4.6),
            FlSpot(1.9, 4.9),
            FlSpot(2, 4),
            FlSpot(2.2, 3.4),
            FlSpot(2.3, 3.2),
            FlSpot(2.4, 3.2),
            FlSpot(2.5, 3.8),
            FlSpot(2.6, 4.2),
            FlSpot(2.7, 4.3),
            FlSpot(2.8, 4.5),
            FlSpot(2.9, 4.7),
            FlSpot(3, 3.3),
            FlSpot(3.1, 3.6),
            FlSpot(3.2, 3.2),
            FlSpot(3.3, 3.4),
            FlSpot(3.5, 3.1),
            FlSpot(3.6, 3.9),
            FlSpot(4, 2.5),
            FlSpot(4.2, 2.8),
            FlSpot(4.3, 2.8),
            FlSpot(4.5, 2.1),
            FlSpot(4.6, 2.4),
            FlSpot(4.7, 2.7),
            FlSpot(4.8, 2.9),
            FlSpot(5, 3.8),
            FlSpot(5.3, 3.8),
            FlSpot(5.5, 4.5),
            FlSpot(5.7, 4.5),
            FlSpot(5.9, 5),
            FlSpot(6.1, 5),
            FlSpot(6.2, 4.8),
            FlSpot(6.3, 4.8),
            FlSpot(6.3, 4.7),
            FlSpot(6.4, 4.9),
            FlSpot(6.6, 3.6),
            FlSpot(6.8, 3.9),
            FlSpot(6.9, 4),
            FlSpot(7, 4.2),
            FlSpot(7.2, 4.3),
            FlSpot(7.3, 4.2),
            FlSpot(7.3, 4.2),
            FlSpot(7.5, 4.6),
            FlSpot(7.9, 4.8),
            FlSpot(8, 4.8),
            FlSpot(8.1, 4),
            FlSpot(8.2, 4),
            FlSpot(8.3, 4.5),
            FlSpot(8.5, 4.6),
            FlSpot(8.6, 4.5),
            FlSpot(8.9, 4.9),
            FlSpot(9, 4.9),
            FlSpot(9.2, 4.5),
            FlSpot(9.4, 4.7),
            FlSpot(9.5, 4.8),
            FlSpot(9.6, 4.8),
            FlSpot(9.7, 4.9),
            FlSpot(9.9, 4),
            FlSpot(10, 5),
            FlSpot(10.3, 3),
            FlSpot(10.5, 3.2),
            FlSpot(10.6, 2.9),
            FlSpot(10.7, 2.9),
            FlSpot(10.9, 4),
            FlSpot(11, 4),
            FlSpot(11, 4),
          ],
          color: Color(0xff3174FB),
          // isCurved: true,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            // gradient: LinearGradient(
            //   colors: [
            //     ColorTween(begin: gradientColors[0], end: gradientColors[1])
            //         .lerp(0.2)!
            //         .withOpacity(0.1),
            //     ColorTween(begin: gradientColors[0], end: gradientColors[1])
            //         .lerp(0.2)!
            //         .withOpacity(0.1),
            //   ],
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            // ),
          ),
        ),
      ],
    );
  }
}
