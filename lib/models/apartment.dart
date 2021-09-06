class Apartment {
  final int price;
  final String location;
  final String ownerName;
  final String imageUrl;
  final int room_number;
  final int bathroom_number;
  final int size;

  Apartment(
      {required this.price,
      required this.location,
      required this.ownerName,
      required this.imageUrl,
      required this.room_number,
      required this.bathroom_number,
      required this.size});
}

List<Apartment> apartments = [
  Apartment(
    price: 120,
    location: 'خانيونس',
    ownerName: 'محمد',
    imageUrl: 'assets/images/house1.jpg',
    room_number: 2,
    bathroom_number: 2,
    size: 150,
  ),
  Apartment(
    price: 320,
    location: 'غزة',
    ownerName: 'احمد',
    imageUrl: 'assets/images/house2.jpg',
    room_number: 4,
    bathroom_number: 3,
    size: 220,
  ),
  Apartment(
    price: 500,
    location: 'جباليا',
    ownerName: 'عبدالله',
    imageUrl: 'assets/images/house3.jpg',
    room_number: 6,
    bathroom_number: 4,
    size: 350,
  ),
  Apartment(
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
