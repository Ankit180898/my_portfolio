import 'package:flutter/material.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectPage extends StatelessWidget {
  final Project project;

  ProjectPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            project.subtitle,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Text(
            'Project Links:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
           GestureDetector(
              onTap: () {
                // Handle link tap (open in browser or navigate)
              },
              child: Text(
                project.projectLinks,
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
         
        ],
      ),
    );
  }
}
