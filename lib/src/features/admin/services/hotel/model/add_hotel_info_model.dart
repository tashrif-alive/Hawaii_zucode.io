class HotelInformation {
  final String id;
  final String name;
  final String location;
  final double rating;
  final List<String> facilities;
  final List<String> rooms;
  final List<String> access;
  final List<String> roomAmenities;
  final List<String> safetySecurity;
  final List<String> bathRoom;
  final List<String> family;
  final List<String> transport;
  final List<String> internetServices;
  final List<String> sports;
  final List<String> servicesAndConveniences;
  final List<String> meds;
  final List<String> languages;
  final String imgUrl;

  HotelInformation({
    required this.id,
    required this.name,
    required this.location,
    required this.rooms,
    required this.rating,
    required this.facilities,
    required this.access,
    required this.roomAmenities,
    required this.safetySecurity,
    required this.bathRoom,
    required this.family,
    required this.transport,
    required this.internetServices,
    required this.sports,
    required this.servicesAndConveniences,
    required this.meds,
    required this.languages,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'rating': rating,
      'rooms': rooms,
      'facilities': facilities,
      'access': access,
      'roomAmenities': roomAmenities,
      'safetySecurity': safetySecurity,
      'bathRoom': bathRoom,
      'family': family,
      'transport': transport,
      'internetServices': internetServices,
      'sports': sports,
      'servicesAndConveniences': servicesAndConveniences,
      'meds': meds,
      'languages': languages,
      'imgUrl': imgUrl
    };
  }

  factory HotelInformation.fromMap(Map<String, dynamic> map) {
    return HotelInformation(
      id: map['id'],
      name: map['name'],
      location: map['location'],
      rating: map['rating'].toDouble(),
      facilities: List<String>.from(map['facilities'] ?? []),
      rooms: List<String>.from(map['rooms'] ?? []),
      access: List<String>.from(map['access'] ?? []),
      roomAmenities: List<String>.from(map['roomAmenities'] ?? []),
      safetySecurity: List<String>.from(map['safetySecurity'] ?? []),
      bathRoom: List<String>.from(map['bathRoom'] ?? []),
      family: List<String>.from(map['family'] ?? []),
      transport: List<String>.from(map['transport'] ?? []),
      internetServices: List<String>.from(map['internetServices'] ?? []),
      sports: List<String>.from(map['sports'] ?? []),
      servicesAndConveniences:
          List<String>.from(map['servicesAndConveniences'] ?? []),
      meds: List<String>.from(map['meds'] ?? []),
      languages: List<String>.from(map['languages'] ?? []),
      imgUrl: map['imgUrl']
    );
  }
}
