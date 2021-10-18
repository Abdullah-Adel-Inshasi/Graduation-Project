import 'package:home_explorer/models/apartment.dart';

/// complaint :
/// user who filed the complaint
/// apartment which only the rented user can file a complaint about
/// the actual complaint
///

class Complaint {
  final String user;
  final Apartment apartment;
  final String text;

  Complaint({required this.user, required this.apartment, required this.text});
}
