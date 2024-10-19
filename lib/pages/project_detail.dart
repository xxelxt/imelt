import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailPage({Key? key, required this.project}) : super(key: key);

  Future<void> _openBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Could not launch $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = project['image'];
    final title = project['title'];
    final description = project['description'];
    final detailedDescription = project['detailedDescription'] ?? 'Không có mô tả chi tiết.';
    final language = project['language'];
    final githubUrl = project['githubUrl'];
    final logos = project['logo'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Project Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null && image.isNotEmpty)
              Hero(
                tag: title,
                child: Material(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 16),
            Text(
              title ?? 'Không có tiêu đề.',
              style: TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description ?? 'Không có mô tả.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // if (detailedDescription.isNotEmpty)
            //   Text(
            //     detailedDescription,
            //     style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            //   ),
            // SizedBox(height: 16),
            if (language != null)
              Text(
                '$language',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 16),
            if (githubUrl != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _openBrowser(githubUrl);
                  },
                  icon: FaIcon(FontAwesomeIcons.github),
                  label: Text('View on GitHub'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
