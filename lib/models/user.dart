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
  int type = 2 ;
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
  int type = 1;
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

List<LandLord> landLord = [
  LandLord(id: 0, fullName: "محمد ابو صفية", email: "a@com", phoneNumber: "0594156728",
      password: "1234567", isRealEstateOffice: false),
  LandLord(id: 1, fullName: "عبد الله النشاصي", email: "abed@hotmail.com", phoneNumber: "0594156728",
      password: "1234567", isRealEstateOffice: false),
];
List<NormalUser> normalUser = [
  NormalUser(id: 0, fullName: "ahmed", email: "h@com", phoneNumber: "059819811",
      password: "1234567", familyNumber: 5, age: "20", isSingle: true),
];

