import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/my_apartments/public_apartments.dart';
import 'package:home_explorer/models/user.dart';

class PrivateApartments extends StatelessWidget {
  final User? user;

  PrivateApartments({required this.user});

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
            apt_name: 'عمارة شارع الجلاء',
            days_until_pay: 12,
            imageUrl: 'https://q-xx.bstatic.com/xdata/images/hotel/840x460/228468448.jpg?k=e9329bc575d79ed7e5ce941f5593ad6eb93cea15de505773c1ec7d85fb221ebe&o=',
            rent: 120,
          ),
          ApartmnetCardLandlord(
            apt_name: 'عمارة الاقصى',
            days_until_pay: 12,
            imageUrl: 'https://housinganywhere.imgix.net/room/1753062/9f2b3ad8-ee53-4fad-940b-989c0926bf35.jpg?auto=format&fit=clip&h=300&orient=0&w=490&ixlib=react-9.2.0',
            rent: 120,
          ),
        ],
      ),
    );
  }
}
