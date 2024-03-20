class Hotel {
  final String id;
  final String hotelName;
  final String hotelType;
  final String location;
  final String imgUrl;
  final int regularHotelCost;
  final int offeredHotelCost;
  final int numberOfRooms;
  final double occupancyRate;
  final double rating;

  Hotel({
    required this.id,
    required this.hotelName,
    required this.hotelType,
    required this.location,
    required this.imgUrl,
    required this.regularHotelCost,
    required this.offeredHotelCost,
    required this.numberOfRooms,
    required this.occupancyRate,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotelName': hotelName,
      'hotelType': hotelType,
      'location': location,
      'imgUrl': imgUrl,
      'regularHotelCost': regularHotelCost,
      'offeredHotelCost': offeredHotelCost,
      'numberOfRooms': numberOfRooms,
      'occupancyRate': occupancyRate,
      'rating': rating,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      id: map['id'],
      hotelName: map['hotelName'],
      hotelType: map['hotelType'],
      location: map['location'],
      imgUrl: map['imgUrl'],
      regularHotelCost: map['regularHotelCost'],
      numberOfRooms: map['numberOfRooms'],
      occupancyRate: map['occupancyRate'],
      rating: map['rating'],
      offeredHotelCost: map['offeredHotelCost'],
    );
  }
}
