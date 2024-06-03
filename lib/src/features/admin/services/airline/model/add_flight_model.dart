class Flight {
  final String id;
  final String airlineName;
  final String date;
   String fromTime;
   String toTime;
  final String duration;
  final String fromPlace;
  final String toPlace;
  final String planeModel;
  final bool refundable;
  final bool insurance;
  final String baggage;
  final String flightClass;
  final double regularPrice;
  final double ourPrice;
  final String imgUrl;
  final String stoppage;
  final String arrivalAirport;
  final String arrivalTerminal;
  final String departureAirport;
  final String departureTerminal;

  Flight({
    required this.id,
    required this.airlineName,
    required this.date,
    this.fromTime='',
    this.toTime='',
    required this.duration,
    required this.fromPlace,
    required this.toPlace,
    required this.planeModel,
    required this.refundable,
    required this.insurance,
    required this.baggage,
    required this.flightClass,
    required this.regularPrice,
    required this.ourPrice,
    required this.imgUrl,
    required this.stoppage,
    required this.arrivalAirport,
    required this.arrivalTerminal,
    required this.departureAirport,
    required this.departureTerminal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'airlineName': airlineName,
      'date': date,
      'fromTime': fromTime,
      'toTime': toTime,
      'duration': duration,
      'fromPlace': fromPlace,
      'toPlace': toPlace,
      'planeModel': planeModel,
      'refundable': refundable,
      'insurance': insurance,
      'baggage': baggage,
      'flightClass': flightClass,
      'regularPrice': regularPrice,
      'ourPrice': ourPrice,
      'imgUrl': imgUrl,
      'stoppage' : stoppage,
      'arrivalAirport':arrivalAirport,
      'arrivalTerminal': arrivalTerminal,
      'departureAirport':departureAirport,
      'departureTerminal': departureTerminal
    };
  }

  factory Flight.fromMap(Map<String, dynamic> map) {
    return Flight(
      id: map['id'],
      airlineName: map['airlineName'],
      date: map['date'],
      fromTime: map['fromTime'],
      toTime: map['toTime'],
      duration: map['duration'],
      fromPlace: map['fromPlace'],
      toPlace: map['toPlace'],
      planeModel: map['planeModel'],
      refundable: map['refundable'],
      insurance: map['insurance'],
      baggage: map['baggage'],
      flightClass: map['flightClass'],
      regularPrice: map['regularPrice'],
      ourPrice: map['ourPrice'],
      imgUrl: map['imgUrl'],
      stoppage: map['stoppage'],
      arrivalAirport: map['arrivalAirport'],
      arrivalTerminal: map['arrivalTerminal'],
      departureAirport: map['departureAirport'],
      departureTerminal: map['departureTerminal']
    );
  }
}
