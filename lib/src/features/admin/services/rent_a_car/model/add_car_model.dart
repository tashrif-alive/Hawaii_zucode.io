class Car {
  final String id;
  final String model;
  final String plateNumber;
  final String color;
  final String type;
  final int seats;
  final bool isAC;
  final double costPerKm;

  Car({
    required this.id,
    required this.model,
    required this.plateNumber,
    required this.color,
    required this.type,
    required this.seats,
    required this.isAC,
    required this.costPerKm,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'model': model,
      'plateNumber': plateNumber,
      'color': color,
      'type': type,
      'seats': seats,
      'isAC': isAC,
      'costPerKm': costPerKm,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'],
      model: map['model'],
      plateNumber: map['plateNumber'],
      color: map['color'],
      seats: map['seats'],
      isAC: map['isAC'],
      costPerKm: map['costPerKm'],
      type: map['type'],
    );
  }
}
