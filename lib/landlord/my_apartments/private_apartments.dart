import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/widgets/landlord_card_aprt.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/user.dart';

class PrivateApartments extends StatelessWidget {
  final User? user;

  const PrivateApartments({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrivateApartment(
          user: user,
        ),
      ],
    );
  }
}

class PrivateApartment extends StatefulWidget {
  late final User? user;

  PrivateApartment({required this.user});

  @override
  State<PrivateApartment> createState() => _PrivateApartmentState();
}

class _PrivateApartmentState extends State<PrivateApartment> {
  late List<RealEstate> realEstates = [];

  @override
  void initState() {
    List<Home> homes = home
        .where((element) => (element.user == widget.user && element.isPrivat))
        .toList();
    List<Store> stores = store
        .where((element) => (element.user == widget.user && element.isPrivat))
        .toList();
    List<WorkSpace> workSpaces = workSpace
        .where((element) => (element.user == widget.user && element.isPrivat))
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
