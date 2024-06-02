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
    this.id = '',
    this.hotelName = '',
    this.hotelType = '',
    this.location = '',
    this.imgUrl = '',
    this.regularHotelCost = 0,
    this.offeredHotelCost = 0,
    this.numberOfRooms = 0,
    this.occupancyRate = 0.0,
    this.rating = 0.0,
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
