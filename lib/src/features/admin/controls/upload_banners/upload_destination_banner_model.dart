class DestinationBanner {
  final String id;
  final String title;
  final String subtitle;
  final String imgUrl;
  final String categories;


  DestinationBanner({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imgUrl,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imgUrl': imgUrl,
      'categories': categories,
    };
  }

  factory DestinationBanner.fromMap(Map<String, dynamic> map) {
    return DestinationBanner(
      id: map['id'],
      imgUrl: map['imgUrl'],
      title: map['title'],
      subtitle: map['subtitle'],
      categories: map['categories'],
    );
  }
}
