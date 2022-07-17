import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vixmo_new/pages/widget_battery/category.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vixmo_new/pages/widget_battery/title_category.dart';
import 'package:vixmo_new/theme.dart';

class Battery extends StatefulWidget {
  @override
  State<Battery> createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
  final List<Color> gradientColors = [
    const Color(0xff36F097),
    const Color(0xff02d391),
  ];

  bool showAvg = false;

  bool isWeekly = true;
  bool isMonthly = false;
  bool isYearly = false;

  void clickWeekly() {
    setState(() {
      isWeekly = true;
      isMonthly = false;
      isYearly = false;
    });
  }

  void clickMonthly() {
    setState(() {
      isWeekly = false;
      isMonthly = true;
      isYearly = false;
    });
  }

  void clickYearly() {
    setState(() {
      isWeekly = false;
      isMonthly = false;
      isYearly = true;
    });
  }

  bool isConsumption = true;
  bool isTrip = false;

  void clickConsumption() {
    setState(() {
      isConsumption = true;
      isTrip = false;
    });
  }

  void clickTrip() {
    setState(() {
      isConsumption = false;
      isTrip = true;
    });
  }

  bool isPressed = false;

  String dropdownvalue = 'Weekly';
  var items = [
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Battery',
          style: poppinsTextStyle.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Charging',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () => isPressed = !isPressed,
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 155,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF0F6FD),
                          ),
                          child: Center(
                            child: !isPressed
                                ? Text(
                                    'Stop Charging',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    'Charging',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            '86',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 36,
                            height: 18,
                            child: Center(
                              child: Text(
                                '98%',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffF87100),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Text(
                            '%',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/car_charge.png'),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      width: 155,
                      height: 48,
                      child: Center(
                        child: Text(
                          'Set Limit Charge',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff111619),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 12, top: 16, right: 12, bottom: 0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              Text(
                                'Time \nRemaining',
                                textAlign: TextAlign.center,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 12,
                                  color: greyFont,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '15 min',
                                textAlign: TextAlign.center,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: greyFont,
                            thickness: 0.2,
                          ),
                          Column(
                            children: [
                              Text(
                                'Current \nCapacity',
                                textAlign: TextAlign.center,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 12,
                                  color: greyFont,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '120 mi',
                                textAlign: TextAlign.center,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: greyFont,
                            thickness: 0.6,
                          ),
                          Column(
                            children: [
                              Text(
                                'Full \nCharge',
                                textAlign: TextAlign.center,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 12,
                                  color: greyFont,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '200 mi',
                                textAlign: TextAlign.center,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last charged to 100%',
                                    style: poppinsTextStyle.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Today 06.32 Am',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 12,
                                      color: Color(0xff8D9BA7),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: greyFont,
                                  ),
                                ),
                                child: Center(
                                  child: DropdownButton(
                                    elevation: 1,
                                    dropdownColor: Colors.white,
                                    underline: SizedBox(),
                                    borderRadius: BorderRadius.circular(10),
                                    value: dropdownvalue,
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
                        SizedBox(
                          height: 16,
                        ),
                        Divider(
                          thickness: 0.2,
                          color: greyFont,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CarouselSlider(
                          items: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Consumption',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1.3,
                                    child: LineChart(
                                      showAvg ? avgData() : mainData(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Trip',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1.3,
                                    child: LineChart(
                                      showAvg ? avgData() : mainData(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 1.9,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 1,
                          ),
                        ),
                        // Container(
                        //   child: AspectRatio(
                        //     aspectRatio: 1.5,
                        //     child: LineChart(
                        //       showAvg ? avgData() : mainData(),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff8D9BA7),
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
      color: Color(0xff67727d),
      // fontWeight: FontWeight.bold,
      fontSize: 14,
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
            strokeWidth: 1,
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
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          barWidth: 3,
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
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
