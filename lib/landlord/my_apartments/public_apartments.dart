import 'package:flutter/material.dart';

import 'package:home_explorer/landlord/widgets/landlord_card_aprt.dart';
import 'package:home_explorer/models/apartment.dart';


class PublicApartments extends StatelessWidget {
  const PublicApartments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApartmentCard_Owner(),
      ],
    );
  }
}

class ApartmentCard_Owner extends StatelessWidget {
  const ApartmentCard_Owner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ApartmnetCardLandlord(
            home: home[0],
          ),
          ApartmnetCardLandlord(
            home: home[1],
          ),
        ],
      ),
    );
  }
}
