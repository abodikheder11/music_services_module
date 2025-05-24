class ServiceModel {
  final String title;
  final String description;
  final String icon;
  final String background;

  ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.background,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
      background: json['background'],
    );
  }
}
