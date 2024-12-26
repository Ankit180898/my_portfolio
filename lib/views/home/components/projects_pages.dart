import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/responsive.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  ProjectFilter selectedFilter = ProjectFilter.all;

  final List<Project> allProjects = [
    Project(
      title: "Sheqonomi",
      description:
          "Discover the difference when millennials and GENZ women curate content that will impact billions. Our world has certainly changed.",
      imageUrl: "2.png",
      liveLink: "https://play.google.com/store/apps/details?id=com.sheqonomi",
      technologies: ["Flutter", "Firebase", "Playstore"],
      type: ProjectType.app,
    ),
    Project(
      title: "FlutterStack",
      description:
          "Curated resources for Flutter Developers. A community-driven platform.",
      imageUrl: "FlutterStack.png",
      githubLink: "https://github.com/Ankit180898/flutter_resource_gallery",
      liveLink: "https://flutterstack.netlify.app/",
      technologies: ["Flutter", "Supabase", "Netlify"],
      type: ProjectType.web,
    ),
    Project(
      title: "Spendify",
      description:
          "An Expense Tracker App to manage your daily expenses. Build using Supabase and Flutter.",
      imageUrl: "Spendify.png",
      githubLink: "https://github.com/Ankit180898/spendify",
      technologies: ["Flutter", "Supabase"],
      type: ProjectType.app,
    ),
    Project(
      title: "Artwork Images",
      description:
          "Artwork Images is a platform where you can find images of some of best artists.",
      imageUrl: "Artworks_Images.png",
      githubLink: "https://github.com/yourusername/ayehigh",
      liveLink: "https://artwork-images.netlify.app/",
      technologies: ["Flutter"],
      type: ProjectType.web,
    ),

    // Add more projects...
  ];

  List<Project> get filteredProjects {
    if (selectedFilter == ProjectFilter.all) return allProjects;
    return allProjects.where((project) {
      switch (selectedFilter) {
        case ProjectFilter.apps:
          return project.type == ProjectType.app;
        case ProjectFilter.websites:
          return project.type == ProjectType.web;
        case ProjectFilter.designs:
          return project.type == ProjectType.design;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: titleText(48),
          ),
          const SizedBox(height: 8),
          Text(
            "Stuffs that I build",
            style: normalText(16),
          ),
          const SizedBox(height: 40),
          Center(
            heightFactor: 1.5,
            child: SegmentedButton<ProjectFilter>(
              segments: [
                ButtonSegment<ProjectFilter>(
                  value: ProjectFilter.all,
                  label: Text('All', style: normalText(14)),
                ),
                ButtonSegment<ProjectFilter>(
                  value: ProjectFilter.apps,
                  label: Text('App', style: normalText(14)),
                  // icon: const Icon(Icons.phone_android),
                ),
                ButtonSegment<ProjectFilter>(
                  value: ProjectFilter.websites,
                  label: Text('Website', style: normalText(14)),
                  // icon: const Icon(Icons.web),
                ),
              ],
              selected: {selectedFilter},
              onSelectionChanged: (Set<ProjectFilter> newSelection) {
                setState(() {
                  selectedFilter = newSelection.first;
                });
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
                  (Set<WidgetState> states) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    );
                  },
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return buttonColor;
                    }
                    return Colors.transparent;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return states.contains(WidgetState.selected)
                        ? Colors.white // White text and icon when selected
                        : Colors.black; // Black text and icon when unselected
                  },
                ),
                overlayColor: WidgetStateProperty.all(buttonColor),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Responsive(
            mobile: ProjectGrid(
              crossAxisCount: 1,
              projects: filteredProjects,
            ),
            tablet: ProjectGrid(
              crossAxisCount: 2,
              projects: filteredProjects,
            ),
            desktop: ProjectGrid(
              crossAxisCount: 3,
              projects: filteredProjects,
            ),
          ),
        ],
      ),
    );
  }
}

enum ProjectFilter {
  all,
  apps,
  websites,
  designs,
}

enum ProjectType {
  app,
  web,
  design,
}

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final List<Project> projects;

  const ProjectGrid({
    super.key,
    required this.crossAxisCount,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.5,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(isHovered ? 1.03 : 1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF2D2D2D),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(51), // 0.2 * 255 = 51
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      color: const Color(0xff0C1116),
                      // padding: const EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Center(
                          child: Image.asset(
                            widget.project.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    if (isHovered)
                      Container(
                        color: Colors.black.withAlpha(102), // 0.4 * 255 = 102
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.project.githubLink != null)
                                IconButton(
                                  icon: const Icon(Icons.code,
                                      color: Colors.white),
                                  onPressed: () => launchUrlString(
                                      widget.project.githubLink!),
                                ),
                              if (widget.project.liveLink != null)
                                IconButton(
                                  icon: const Icon(Icons.launch,
                                      color: Colors.white),
                                  onPressed: () =>
                                      launchUrlString(widget.project.liveLink!),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: titleText(20).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: normalText(14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.technologies
                          .map((tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3C3C3C),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  tech,
                                  style: normalText(12).copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
