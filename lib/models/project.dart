import 'package:portfolio/views/home/components/projects_pages.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String? githubLink;
  final String? liveLink;
  final List<String> technologies;
  final ProjectType type;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.githubLink,
    this.liveLink,
    required this.technologies,
    required this.type,
  });
}
