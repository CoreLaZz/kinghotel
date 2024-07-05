class SliderItem {
  final String title;
  final String description;
  final String image;

  SliderItem({required this.title, required this.description, required this.image});

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
