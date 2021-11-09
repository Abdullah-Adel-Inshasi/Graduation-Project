import 'apartment.dart';

class User{

final int id;
final String fullName;
final String email;
final String phoneNumber;
final String password;

User({required this.id, required this.fullName, required this.email, required this.phoneNumber, required this.password});

}

class LandLord extends User{
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final bool isRealEstateOffice;
  String OfficeName = "";
  Address OfficeAddress = Address(city: "", street: "", estateNo: "") ;

  LandLord(
      {required this.id,
       required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.isRealEstateOffice}) : super(
      id: id,
      email: email,
      fullName: fullName,
      password: password,
      phoneNumber: phoneNumber);

  LandLord.isOffice(
      {required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.password,
        required this.isRealEstateOffice,
        required this.OfficeName,
        required this.OfficeAddress}) : super(
      id: id,
      email: email,
      fullName: fullName,
      password: password,
      phoneNumber: phoneNumber);

}


class NormalUser extends User{
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final int familyNumber;
  final String age;
  final bool isSingle;
  String OfficeName = "";
  Address OfficeAddress = Address(city: "", street: "", estateNo: "") ;

  NormalUser(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.familyNumber,
      required this.age,
      required this.isSingle}) : super(
      id: id,
      email: email,
      fullName: fullName,
      password: password,
      phoneNumber: phoneNumber);

}

List<LandLord> landLord = [];
List<NormalUser> normalUser = [];

