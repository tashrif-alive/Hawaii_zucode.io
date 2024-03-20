class Driver {
  final String id;
  final String name;
  final String phoneNumber;
  final int nid; // National ID field
  final String carModel;
  final String carPlateNumber;
  final String carColor;
  final String carType;
  final String drivingLicense; // Driving license field
  final bool available;

  Driver({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.nid,
    required this.carModel,
    required this.carPlateNumber,
    required this.carColor,
    required this.carType,
    required this.drivingLicense,
    required this.available,
  });

  // Method to convert Driver object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'nid': nid,
      'carModel': carModel,
      'carPlateNumber': carPlateNumber,
      'carColor': carColor,
      'carType': carType,
      'drivingLicense': drivingLicense,
      'available': available,
    };
  }

  // Factory method to create a Driver object from a Map
  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      nid: map['nid'],
      carModel: map['carModel'],
      carPlateNumber: map['carPlateNumber'],
      carColor: map['carColor'],
      carType: map['carType'],
      drivingLicense: map['drivingLicense'],
      available: map['available'],
    );
  }
}
