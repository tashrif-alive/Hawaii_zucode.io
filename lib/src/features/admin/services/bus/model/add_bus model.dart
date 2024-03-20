class Bus {
  final String id;
  final String busCompany;
  final String date;
  final String departureTime;
  final String arrivalTime;
  final String type;
  final String duration;
  final String sourceLocation;
  final String routeDestination;
  final String destinationLocation;

  Bus({
    required this.id,
    required this.busCompany,
    required this.date,
    required this.departureTime,
    required this.type,
    required this.arrivalTime,
    required this.duration,
    required this.sourceLocation,
    required this.routeDestination,
    required this.destinationLocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'busCompany': busCompany,
      'date': date,
      'departureTime': departureTime,
      'type' : type,
      'arrivalTime': arrivalTime,
      'duration': duration,
      'sourceLocation': sourceLocation,
      'routeDestination': routeDestination,
      'destinationLocation': destinationLocation,
    };
  }
}
