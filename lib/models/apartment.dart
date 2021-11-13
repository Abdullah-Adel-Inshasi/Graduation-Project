import 'package:home_explorer/models/user.dart';

class Apartment {
  final String? name;
  final int price;
  final String location;
  final String ownerName;
  final String imageUrl;
  final int room_number;
  final int bathroom_number;
  final int size;

  Apartment({this.name,
    required this.price,
    required this.location,
    required this.ownerName,
    required this.imageUrl,
    required this.room_number,
    required this.bathroom_number,
    required this.size});
}

List<Apartment> apartments = [
  Apartment(
    name: 'no.1',
    price: 120,
    location: 'خانيونس',
    ownerName: 'محمد',
    imageUrl: 'assets/images/house1.jpg',
    room_number: 2,
    bathroom_number: 2,
    size: 150,
  ),
  Apartment(
    name: 'no.2',
    price: 320,
    location: 'غزة',
    ownerName: 'احمد',
    imageUrl: 'assets/images/house2.jpg',
    room_number: 4,
    bathroom_number: 3,
    size: 220,
  ),
  Apartment(
    name: 'no.3',
    price: 500,
    location: 'جباليا',
    ownerName: 'عبدالله',
    imageUrl: 'assets/images/house3.jpg',
    room_number: 6,
    bathroom_number: 4,
    size: 350,
  ),
  Apartment(
    name: 'no.3',
    price: 250,
    location: 'نل الهوا',
    ownerName: 'عزيز',
    imageUrl: 'assets/images/house4.jpg',
    room_number: 3,
    bathroom_number: 3,
    size: 250,
  ),
  Apartment(
    price: 23,
    location: 'رفج',
    ownerName: 'يزن',
    imageUrl: 'assets/images/house5.jpg',
    room_number: 3,
    bathroom_number: 3,
    size: 250,
  )
];

// class User {
//   final String name;
//   final String email;
//   final String phoneNumber;
//   final String profileImgUrl;
//
//   User(this.name, this.email, this.phoneNumber, this.profileImgUrl);
// }

// class Owner extends User {
//   final List<RealEstate> myRealEstate;
//
//   Owner({
//     required this.myRealEstate,
//     required String name,
//     required String email,
//     required String phoneNumber,
//     required String profileImgUrl,
//   }) : super(name, email, phoneNumber, profileImgUrl);
// }

// Owner owner = Owner(
//   name: 'ahmad',
//   email: 'blahblah@blah.com',
//   phoneNumber: '123',
//   profileImgUrl: '',
//   myRealEstate: [],
// );

class Address {
  final String city;
  final String street;
  final String estateNo;
  final String? buildingName;

  Address({required this.city, required this.street, required this.estateNo, this.buildingName});

  @override
  String toString() {
    // TODO: implement toString
    return "$city - $street - $estateNo" + (buildingName!=null ? "- $buildingName" : "");
  }

}

enum RealEstateType { home, workspace, shops }

class RealEstate {
  final User user;
  final RealEstateType type;
  final double downpayment;
  final double monthlyRent;
  final String name;
  final Address address;
  final double size;
  final List<String> imgUrl;
  final String coverImg;
  final String aboutEstate;
  final DateTime beginObservation;
  final DateTime endObservation;
  final bool isAvailable;

  RealEstate({required this.user,
    required this.type,
    required this.downpayment,
    required this.monthlyRent,
    required this.name,
    required this.address,
    required this.size,
    required this.imgUrl,
    required this.coverImg,
    required this.aboutEstate,
    required this.beginObservation,
    required this.endObservation,
    required this.isAvailable});
}

class Store extends RealEstate {
  bool? hasAc = false;
  bool? hasFurnature = false;
  bool? hasPowerLine = false;
  final int stockRoomSize;
  final String finishingStatus;
  final String exhibitionRating;

  Store({this.hasFurnature,
    required this.finishingStatus,
    required this.exhibitionRating,
    this.hasAc,
    this.hasPowerLine,
    required this.stockRoomSize,
    required User user,
    RealEstateType type = RealEstateType.shops,
    required double downpayment,
    required double monthlyRent,
    required String name,
    required Address address,
    required double size,
    required List<String> imgUrl,
    required String coverImg,
    required String aboutEstate,
    required DateTime beginObservation,
    required DateTime endObservation,
    required bool isAvailable})
      : super(
      name: name,
      type: type,
      size: size,
      aboutEstate: aboutEstate,
      address: address,
      beginObservation: beginObservation,
      coverImg: coverImg,
      downpayment: downpayment,
      endObservation: endObservation,
      imgUrl: imgUrl,
      isAvailable: isAvailable,
      monthlyRent: monthlyRent,
      user: user);
}

enum Direction {
  north,
  east,
  west,
  south,
  northEast,
  northWest,
  southWest,
  southEast
}

bool hasElevator = true;
// class Advantage{
//   final String label;
//   final String isAvailable;
//
//   Advantage(this.label, this.isAvailable);
// }
//
// List<Advantage> homeAvantage= [
//   Advantage('مصعد', false)
// ];
// enum Advantage { elevator, ac, nearSuperMarket, nearMosque, onCrossRoad }
enum HomeType { apartment, roof, house }

class Home extends RealEstate {
  final int numOfBathroom;
  final int numOfRoom;
  final int numOfHalls;
  final int floor;
  int? apartmentNumber = -1;
  final String direction;
  final HomeType typeOfHome;
  bool? hasElevator = false;
  bool? hasFurnature = false;
  bool? hasAC = false;
  bool? hasGarage = false;
  bool? closeFromMosque = false;
  bool? closeFromSchool = false;

  Home({required this.numOfBathroom,
    required this.numOfRoom,
    required this.numOfHalls,
    required this.floor,
    this.apartmentNumber,
    this.hasFurnature,
    this.hasAC,
    this.hasElevator,
    this.hasGarage,
    this.closeFromMosque,
    this.closeFromSchool,
    required this.direction,
    required this.typeOfHome,
    required User user,
    // required RealEstateType type,
    required double downpayment,
    required double monthlyRent,
    required String name,
    required Address address,
    required double size,
    required List<String> imgUrl,
    required String coverImg,
    required String aboutEstate,
    required DateTime beginObservation,
    required DateTime endObservation,
    required bool isAvailable})
      : super(
      name: name,
      type: RealEstateType.home,
      size: size,
      aboutEstate: aboutEstate,
      address: address,
      beginObservation: beginObservation,
      coverImg: coverImg,
      downpayment: downpayment,
      endObservation: endObservation,
      imgUrl: imgUrl,
      isAvailable: isAvailable,
      monthlyRent: monthlyRent,
      user: user);
}

class WorkSpace extends RealEstate {
  final int floorNum;
  final int numOfDesks;
  final String internetStatus;
  bool hasAC = false;
  bool hasPowerCable = false;
  bool hasElevator = false;

  WorkSpace({required this.floorNum,
    required this.numOfDesks,
    required this.internetStatus,
    required this.hasElevator,
    required this.hasAC,
    required this.hasPowerCable,
    required User user,
    required RealEstateType type,
    required double downpayment,
    required double monthlyRent,
    required String name,
    required Address address,
    required double size,
    required List<String> imgUrl,
    required String coverImg,
    required String aboutEstate,
    required DateTime beginObservation,
    required DateTime endObservation,
    required bool isAvailable})
      : super(
      name: name,
      type: type,
      size: size,
      aboutEstate: aboutEstate,
      address: address,
      beginObservation: beginObservation,
      coverImg: coverImg,
      downpayment: downpayment,
      endObservation: endObservation,
      imgUrl: imgUrl,
      isAvailable: isAvailable,
      monthlyRent: monthlyRent,
      user: user);
}


List<Store> store = [
  // Store(stockRoomSize: 100, owner: owner, downpayment: 200, finishingStatus: "سوبر لوكس",exhibitionRating: "معرض مجمع",
  //     monthlyRent: 180, name: "no.1", address: address2, size: 150, imgUrl: ['assets/images/house3.jpg'],
  //     coverImg: 'assets/images/house3.jpg',aboutEstate: "الوصف...", beginObservation: startDate1,
  //     endObservation: EndDate1, isAvailable: true,hasAc: true,hasFurnature: true),
];
List<WorkSpace> workSpace = [];
Address address1 = Address(city: "غزة", street: "شارع الشهداء", estateNo: "مقابل مترو",buildingName: "عمارة الحساينة");
Address address2 = Address(city: "رفح", street: "شارع الثورة", estateNo: "غرب مخبز الدهشان");

DateTime startDate1 = DateTime(2021,2,19,12,30,0,0,0);
DateTime EndDate1 = DateTime(2021,2,25,30,30,0,0,0);

List<Home> home = [
  // Home(numOfBathroom: 2, numOfRoom: 4, direction: Direction.northEast.toString(),numOfHalls: 2,floor: 6,
  //     typeOfHome: HomeType.house, owner: owner, downpayment: 300,apartmentNumber: 23,
  //     monthlyRent: 250, name: 'no.1', address: address1, size: 170, imgUrl: ['assets/images/house1.jpg'],
  //     coverImg: 'assets/images/house1.jpg', aboutEstate: "وصف الشقة.....", beginObservation: startDate1,
  //     endObservation: EndDate1, isAvailable: true,hasFurnature: true,closeFromMosque: true,hasGarage: true),
  // Home(numOfBathroom: 1, numOfRoom: 3, direction: Direction.northEast.toString(),numOfHalls: 1,floor: 2,
  //     typeOfHome: HomeType.house, owner: owner, downpayment: 200,
  //     monthlyRent: 150, name: 'no.2', address: address2, size: 115, imgUrl: ['assets/images/house3.jpg'],
  //     coverImg: 'assets/images/house3.jpg', aboutEstate: "وصف الشقة ....", beginObservation: startDate1,
  //     endObservation: EndDate1, isAvailable: false,closeFromMosque: true,hasAC: true,closeFromSchool: true,),
];