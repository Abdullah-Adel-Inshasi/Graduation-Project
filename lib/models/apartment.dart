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

class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String profileImgUrl;

  User(this.name, this.email, this.phoneNumber, this.profileImgUrl);
}

class Owner extends User {
  final List<RealEstate> myRealEstate;

  Owner({
    required this.myRealEstate,
    required String name,
    required String email,
    required String phoneNumber,
    required String profileImgUrl,
  }) : super(name, email, phoneNumber, profileImgUrl);
}

Owner owner = Owner(
  name: 'ahmad',
  email: 'blahblah@blah.com',
  phoneNumber: '123',
  profileImgUrl: '',
  myRealEstate: [],
);

class Address {
  final String city;
  final String street;
  final String estateNo;
  final String? buildingName;

  Address(
      {required this.city, required this.street, required this.estateNo, this.buildingName});
}

enum RealEstateType { home, workspace, shops }

class RealEstate {
  final Owner owner;
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

  RealEstate({required this.owner,
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

  Store({this.hasFurnature,
    this.hasAc,
    this.hasPowerLine,
    required this.stockRoomSize,
    required Owner owner,
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
      owner: owner);
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
  final Direction direction;
  final HomeType typeOfHome;
  bool? hasElevator = false;
  bool? hasFurnature = false;
  bool? hasAC = false;
  bool? hasGarage = false;
  bool? closeFromMosque = false;
  bool? closeFromSchool = false;

  Home({required this.numOfBathroom,
    required this.numOfRoom,
    this.hasFurnature,
    this.hasAC,
    this.hasElevator,
    this.hasGarage,
    this.closeFromMosque,
    this.closeFromSchool,
    required this.direction,
    required this.typeOfHome,
    required Owner owner,
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
      owner: owner);
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
    required Owner owner,
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
      owner: owner);
}

