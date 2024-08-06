import 'package:flutter/material.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectPage extends StatelessWidget {
  final Project project;

  const ProjectPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            project.subtitle,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const Text(
            'Project Links:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
           GestureDetector(
              onTap: () {
                // Handle link tap (open in browser or navigate)
              },
              child: Text(
                project.projectLinks,
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
         
        ],
      ),
    );
  }
}
