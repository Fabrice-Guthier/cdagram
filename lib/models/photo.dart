class Photo {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int width;
  final int height;
  final String color;
  final int likes;
  final int downloads;
  final String description;
  final String author;
  final String url;

  const Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.likes,
    required this.downloads,
    required this.description,
    required this.author,
    required this.url,
  });
}
