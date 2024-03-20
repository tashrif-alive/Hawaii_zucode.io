class AliancesBanner {
  final String id;
  final String imgUrl;


  AliancesBanner({
    required this.id,
    required this.imgUrl,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
    };
  }

  factory AliancesBanner.fromMap(Map<String, dynamic> map) {
    return AliancesBanner(
        id: map['id'],
        imgUrl: map['imgUrl'],
    );
  }
}
