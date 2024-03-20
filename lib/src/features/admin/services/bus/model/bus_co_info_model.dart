class BusCompany {
  final String id;
  late final String busCompany;
  late final String address;
  final List<String> routes;
  late final String departureTime;
  late final String arrivalTime;
  late final String type;
  late final String duration;
  late final String sourceLocation;
  late final String routeDestination;
  late final String destinationLocation;

  BusCompany({
    required this.id,
    required this.busCompany,
    required this.address,
    required this.routes,
    required this.departureTime,
    required this.arrivalTime,
    required this.type,
    required this.duration,
    required this.sourceLocation,
    required this.routeDestination,
    required this.destinationLocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'busCompany': busCompany,
      'address': address,
      'routes': routes,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
      'type': type,
      'duration': duration,
      'sourceLocation': sourceLocation,
      'routeDestination': routeDestination,
      'destinationLocation': destinationLocation,
    };
  }

  factory BusCompany.fromMap(Map<String, dynamic> map) {
    return BusCompany(
      id: map['id'],
      busCompany: map['busCompany'],
      address: map['address'],
      routes: List<String>.from(map['routes'] ?? []),
      departureTime: map['departureTime'],
      arrivalTime: map['arrivalTime'],
      type: map['type'],
      duration: map['duration'],
      sourceLocation: map['sourceLocation'],
      routeDestination: map['routeDestination'],
      destinationLocation: map['destinationLocation'],
    );
  }
}
