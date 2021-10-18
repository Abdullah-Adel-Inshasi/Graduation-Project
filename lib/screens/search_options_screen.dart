import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/constants/styles.dart';
import 'package:home_explorer/widgets/appBar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchOptionScreen extends StatelessWidget {
  const SearchOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                    AveragePriceSelector(),
                    SizedBox(height: 64),
                    CitySelector(),
                    SizedBox(height: 16),
                    SizeSelector(),
                    SizedBox(height: 32),
                    EstateType(),
                    SizedBox(height: 32),
                    TimeSelector(),
                    SizedBox(height: 50),
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
  @override
  Widget build(BuildContext context) {
    final SfRangeValues _priceRange = SfRangeValues(1, 12);
    final Function updateStartPrice;
    final Function updateEndPrice;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مدة العقد',style: GoogleFonts.tajawal(fontSize: 18,color: Colors.black),),
        SizedBox(height: 16),
        SfRangeSelector(
          child: SizedBox(
            width: double.infinity,
          ),
          min: _priceRange.start,
          max: _priceRange.end,
          initialValues: _priceRange,
          // showTicks: true,
          // showDividers: true,
          showLabels: true,
          // enableIntervalSelection: true,
          interval: 1,
          enableTooltip: true,
          stepSize: 1,
          tooltipShape: SfRectangularTooltipShape(),
          minorTickShape: SfTickShape(),
          onChanged: (SfRangeValues values) {},
          activeColor: Colors.blue,
          inactiveColor: Colors.transparent,
          enableIntervalSelection: true,

        )
      ],
    );
  }
}

class EstateType extends StatefulWidget {
  const EstateType({Key? key}) : super(key: key);

  @override
  State<EstateType> createState() => _EstateTypeState();
}

class _EstateTypeState extends State<EstateType> {
  List<String> estateTypes = ['شقة', 'منزل', 'غرفة'];

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
          value: estateTypes[0],
          onChanged: (x) {},
          items: estateTypes
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

  String city = 'غزة';

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
          onChanged: (_) {},
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
      activeColor: Colors.blue,
      inactiveColor: Colors.transparent,
    );
  }
}
