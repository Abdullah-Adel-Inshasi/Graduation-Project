import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/widgets/landlord_card_aprt.dart';
import 'package:home_explorer/models/apartment.dart';

class PrivateApartments extends StatelessWidget {
  const PrivateApartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrivateApartment(),
      ],
    );
  }
}

class PrivateApartment extends StatelessWidget {
  const PrivateApartment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ApartmnetCardLandlord(
            home: home[1],
          ),
          ApartmnetCardLandlord(
            home: home[0],
          ),
        ],
      ),
    );
  }
}

