import 'package:flutter/material.dart';

import 'package:home_explorer/landlord/widgets/landlord_card_aprt.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/user.dart';

class PublicApartments extends StatelessWidget {
  late final User? user;

  PublicApartments({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApartmentCard_Owner(
          user: user,
        ),
      ],
    );
  }
}

class ApartmentCard_Owner extends StatefulWidget {
  final User? user;

  const ApartmentCard_Owner({Key? key, required this.user}) : super(key: key);

  @override
  State<ApartmentCard_Owner> createState() => _ApartmentCard_OwnerState();
}

class _ApartmentCard_OwnerState extends State<ApartmentCard_Owner> {
  late List<RealEstate> realEstates = [];

  @override
  void initState() {
    List<Home> homes = home
        .where((element) => (element.user == widget.user && !element.isPrivat))
        .toList();
    List<Store> stores = store
        .where((element) => (element.user == widget.user && !element.isPrivat))
        .toList();
    List<WorkSpace> workSpaces = workSpace
        .where((element) => (element.user == widget.user && !element.isPrivat))
        .toList();
    realEstates.addAll(homes);
    realEstates.addAll(stores);
    realEstates.addAll(workSpaces);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: realEstates
            .map((e) => ApartmnetCardLandlord(realEstate: e))
            .toList(),
      ),
    );
  }
}
