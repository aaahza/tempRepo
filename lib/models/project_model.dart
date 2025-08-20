class Project {
  final String title;
  final String category;
  final String year;
  final List<String> descriptions;
  final String linkText;
  final String linkUrl;
  final String imagePath;

  const Project({
    required this.title,
    required this.category,
    required this.year,
    required this.descriptions,
    required this.linkText,
    required this.linkUrl,
    required this.imagePath,
  });
}
