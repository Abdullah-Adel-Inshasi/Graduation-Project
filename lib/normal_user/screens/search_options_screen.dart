import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/constants/styles.dart';
import 'package:home_explorer/widgets/appBar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            CustomAppBar2(
              label: 'إعادة ضبط الفلتر',
              labelOnTap: () {},
              iconData: Icons.arrow_forward_ios_sharp,
              iconOnTap: () => Navigator.pop(context),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EstateType(),
                    SizedBox(height: 32),
                    AveragePriceSelector(),
                    SizedBox(height: 64),
                    CitySelector(),
                    SizedBox(height: 16),
                    SizeSelector(),
                    SizedBox(height: 32),
                    TimeSelector(),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF14688C),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'بحث',
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ), // CitySelector(),
          ],
        ),
      ),
    );
  }
}

class TimeSelector extends StatefulWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  List<String> timeRange = [
    'قصير المدة (1- 3 شهور)',
    'متوسط المدة (3 - 9 شهور)',
    'طويل المدة (9+ أشهر)'
  ];
  late String selectedTimeRange;

  @override
  void initState() {
    selectedTimeRange = timeRange[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مدة العقد',
          style: GoogleFonts.tajawal(fontSize: 18, color: Colors.black),
        ),
        SizedBox(height: 16),
        DropdownButton(
          value: selectedTimeRange,
          onChanged: (x) => setState(() => selectedTimeRange = x.toString()),
          items: timeRange
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class EstateType extends StatefulWidget {
  @override
  State<EstateType> createState() => _EstateTypeState();
}

class _EstateTypeState extends State<EstateType> {
  List<String> estateTypes = ['شقة سكنية\\ منزل', 'مساحة عمل', 'متجر'];
  late String selectedEstateType;
  int numOfRooms = 0;
  int numOfBathrooms = 0;

  @override
  void initState() {
    selectedEstateType = estateTypes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع العقار',
          style: kHeadlineTextStyle,
        ),
        DropdownButton(
          borderRadius: BorderRadius.circular(15),
          value: selectedEstateType,
          onChanged: (x) {
            setState(() => selectedEstateType = x.toString());
          },
          items: estateTypes
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
        ),
        selectedEstateType == estateTypes[0]
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عدد الغرف',
                    style:
                        GoogleFonts.tajawal(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          numOfRooms > 0
                              ? setState(() {
                                  numOfRooms--;
                                })
                              : null;
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      ),
                      Text(
                        numOfRooms.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            numOfRooms++;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'عدد الحمامات',
                    style:
                        GoogleFonts.tajawal(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          numOfBathrooms > 0
                              ? setState(() {
                                  numOfBathrooms--;
                                })
                              : null;
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      ),
                      Text(
                        numOfBathrooms.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            numOfBathrooms++;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      )
                    ],
                  )
                ],
              )
            : SizedBox(),
      ],
    );
  }
}

class SizeSelector extends StatelessWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المساحة',
          style: kHeadlineTextStyle,
        ),
        Container(
          width: 200,
          child: TextField(
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              // hintTextDirection: TextDirection.rtl,
              hintText: 'متوسط مساحة العقار',
              suffixText: 'متر مربع',
              // prefixStyle: TextStyle()
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }
}

class CitySelector extends StatefulWidget {
  @override
  _CitySelectorState createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  final List<String> cities = [
    'غزة',
    'الزهراء',
    'جباليا',
    'رفح',
    'خانيونس',
    'النصيرات'
  ];

  late String city;

  @override
  void initState() {
    city = 'غزة';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المنطقة \\ الحي',
          style: kHeadlineTextStyle,
        ),
        DropdownButton(
          value: city,
          onChanged: (x) => setState(() => city = x.toString()),
          items: cities
              .map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  onTap: () {
                    setState(() {
                      city = e;
                    });
                  },
                  value: e,
                ),
              )
              .toList(),
        ),
        SizedBox(height: 16),
        Container(
          height: 242,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            crossAxisSpacing: 20,
            mainAxisSpacing: 12,
            children: cities
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/house1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                              child: DecoratedBox(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                              )
                            ]),
                          )),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              style: GoogleFonts.tajawal(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

class AveragePriceSelector extends StatefulWidget {
  @override
  _AveragePriceSelectorState createState() => _AveragePriceSelectorState();
}

class _AveragePriceSelectorState extends State<AveragePriceSelector> {
  double startPrice = 70;
  double endPrice = 240;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'متوسط السعر',
          style: kHeadlineTextStyle,
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${startPrice.toInt()}',
              style: GoogleFonts.tajawal(),
            ),
            Text('${endPrice.toInt()}'),
          ],
        ),
        SizedBox(height: 8),
        Container(
          child: PriceRangeSelector(
            updateStartPrice: (double newStartPrice) {
              setState(
                () {
                  startPrice = newStartPrice;
                },
              );
            },
            updateEndPrice: (double newEndPrice) {
              setState(
                () {
                  endPrice = newEndPrice;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class PriceRangeSelector extends StatelessWidget {
  final SfRangeValues _priceRange = SfRangeValues(70.0, 150);
  final Function updateStartPrice;
  final Function updateEndPrice;

  PriceRangeSelector(
      {required this.updateStartPrice, required this.updateEndPrice});

  @override
  Widget build(BuildContext context) {
    return SfRangeSelector(
      child: SizedBox(
        width: double.infinity,
      ),
      min: 70,
      max: 350,
      initialValues: _priceRange,
      // showTicks: true,
      showDividers: true,
      showLabels: true,
      // enableIntervalSelection: true,
      interval: 50,
      enableTooltip: true,
      stepSize: 10,
      tooltipShape: SfPaddleTooltipShape(),
      minorTickShape: SfTickShape(),
      onChanged: (SfRangeValues values) {
        updateStartPrice(values.start);
        updateEndPrice(values.end);
      },
      activeColor: Color(0xFF14688C),
      inactiveColor: Colors.transparent,
    );
  }
}
