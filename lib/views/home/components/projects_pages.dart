import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/responsive.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum ProjectFilter {
  all,
  apps,
  websites,
}

enum ProjectType {
  app,
  web,
  design,
}

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String selectedFilter = 'all'; // Default selected filter

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
      title: "Home|Home 4IM",
      description:
          "Home is a social networking app designed to support and connect individuals starting their new life in a foreign country. Our mission is to create a welcoming community where users can share experiences, ask questions, and find helpful resources.",
      imageUrl: "3.png",
      liveLink:
          "https://play.google.com/store/apps/details?id=com.home4im&hl=en_US",
      technologies: ["Flutter", "Firebase", "Playstore"],
      type: ProjectType.app,
    ),
    Project(
      title: "Home|Website",
      description:
          "Home is a social networking app designed to support and connect individuals starting their new life in a foreign country. Our mission is to create a welcoming community where users can share experiences, ask questions, and find helpful resources.",
      imageUrl: "6.webp",
      liveLink: "https://home4im.vercel.app/",
      technologies: ["Flutter", "Firebase", "Vercel"],
      type: ProjectType.web,
    ),
    Project(
      title: "BlogD",
      description: "BlogD is a blogging app",
      imageUrl: "7.png",
      githubLink: "https://github.com/Ankit180898/blog_app",
      technologies: ["Flutter", "Supabase"],
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
      technologies: ["Flutter", "Netlify"],
      type: ProjectType.web,
    ),

    // Add more projects...
  ];

  List<Project> get filteredProjects {
    if (selectedFilter == 'all') return allProjects;
    return allProjects.where((project) {
      switch (selectedFilter) {
        case 'apps':
          return project.type == ProjectType.app;
        case 'websites':
          return project.type == ProjectType.web;
        case 'designs':
          return project.type == ProjectType.design;
        default:
          return true;
      }
    }).toList();
  }

  Widget _buildFilterButton(String filter, String label, BuildContext context) {
    bool isSelected = selectedFilter == filter;
    bool isFirst = filter == 'all';
    bool isLast = filter == 'websites';

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedFilter = filter),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? 8.0 : 12.0,
          ),
          decoration: BoxDecoration(
            color: isSelected ? buttonColor : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: isFirst ? const Radius.circular(24.0) : Radius.zero,
              right: isLast ? const Radius.circular(24.0) : Radius.zero,
            ),
            border: Border.all(
              color: isSelected ? buttonColor : Colors.grey.withAlpha(100),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: normalText(
                Responsive.isMobile(context) ? 14 : 16,
                textColor: isSelected ? Colors.white : buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double padding = constraints.maxWidth > 1200
            ? 24
            : constraints.maxWidth > 600
                ? 16
                : 12;

        return Container(
          color: const Color(0xFF1E1E1E),
          padding: EdgeInsets.symmetric(
            horizontal: padding,
            vertical: Responsive.isMobile(context) ? 24 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Projects",
                style: titleText(Responsive.isMobile(context) ? 32 : 48),
              ),
              const SizedBox(height: 8),
              Text(
                "From Concept to Creation",
                style: normalText(Responsive.isMobile(context) ? 14 : 16),
              ),
              SizedBox(height: Responsive.isMobile(context) ? 24 : 40),

              // Filter buttons
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.1,
                ),
                child: Row(
                  children: [
                    _buildFilterButton('all', 'All', context),
                    _buildFilterButton('apps', 'Apps', context),
                    _buildFilterButton('websites', 'Websites', context),
                  ],
                ),
              ),

              SizedBox(height: Responsive.isMobile(context) ? 24 : 40),

              // Projects grid
              Responsive(
                mobile: ProjectGrid(
                  crossAxisCount: 1,
                  childAspectRatio: 1.3,
                  projects: filteredProjects,
                ),
                tablet: ProjectGrid(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  projects: filteredProjects,
                ),
                desktop: ProjectGrid(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,
                  projects: filteredProjects,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<Project> projects;

  const ProjectGrid({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: Responsive.isMobile(context) ? 1.1 : childAspectRatio,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
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

  void _handleTap() {
    if (widget.project.liveLink != null) {
      launchUrlString(widget.project.liveLink!);
    } else if (widget.project.githubLink != null) {
      launchUrlString(widget.project.githubLink!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = !isMobile),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: Card(
          elevation: isHovered ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color(0xFF2D2D2D),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        widget.project.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (isHovered && !isMobile)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.project.githubLink != null)
                              IconButton(
                                icon: const Icon(Icons.code, color: Colors.white),
                                onPressed: () => launchUrlString(
                                  widget.project.githubLink!,
                                ),
                              ),
                            if (widget.project.liveLink != null)
                              IconButton(
                                icon: const Icon(Icons.launch, color: Colors.white),
                                onPressed: () => launchUrlString(
                                  widget.project.liveLink!,
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: titleText(16).copyWith(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          widget.project.description,
                          style: normalText(12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: widget.project.technologies
                            .map((tech) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3C3C3C),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    tech,
                                    style: normalText(10)
                                        .copyWith(color: Colors.white70),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}