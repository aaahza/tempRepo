class Experience {
  final String company;
  final String position;
  final String duration;
  final String location;
  final String industry;
  final String? websiteText;
  final String? websiteUrl;
  final List<String> descriptions;
  final String subtitle;

  const Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.location,
    required this.industry,
    this.websiteText,
    this.websiteUrl,
    required this.descriptions,
    required this.subtitle,
  });
}
