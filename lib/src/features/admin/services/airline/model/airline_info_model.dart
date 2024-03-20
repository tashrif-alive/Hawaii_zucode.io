class Airline {
  final String id;
  final String airline;
  final String address;
  final String airplaneModel;
  final String imgUrl;
  final String facilities;
  final List<String> routes;
  final bool refundable;
  final bool insurance;

  Airline({
    required this.id,
    required this.airline,
    required this.address,
    required this.airplaneModel,
    required this.facilities,
    required this.imgUrl,
    required this.routes,
    required this.refundable,
    required this.insurance,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'airline': airline,
      'address': address,
      'airplaneModel': airplaneModel,
      'facilities': facilities,
      'imgUrl': imgUrl,
      'routes': routes,
      'refundable': refundable,
      'insurance': insurance,
    };
  }

  factory Airline.fromMap(Map<String, dynamic> map) {
    return Airline(
      id: map['id'],
      airline: map['airline'],
      address: map['address'],
      airplaneModel: map['airplaneModel'],
      facilities: map['facilities'],
      imgUrl: map['imgUrl'],
      routes: List<String>.from(map['routes'] ?? []),
      refundable: map['refundable'],
      insurance: map['insurance'],
    );
  }
}
