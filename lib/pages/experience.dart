import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperiencePage extends StatefulWidget {
  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> experiences = [
    // {
    //   'title': '',
    //   'company': '',
    //   'duration': '',
    //   'description': '',
    //   'skills': [],
    // },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 6.0, top: 20.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Kinh nghiệm làm việc',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Chính thức'),
            Tab(text: 'Thực tập'),
            Tab(text: 'Khác'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [

            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                // return buildExperienceCard(exp);
                return SizedBox.shrink(); // Placeholder for now
              },
            ),

            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                // return buildExperienceCard(exp);
                return SizedBox.shrink(); // Placeholder for now
              },
            ),

            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                // return buildExperienceCard(exp);
                return SizedBox.shrink(); // Placeholder for now
              },
            ),
          ],
        ),
      ),
    );
  }

  /*
  Widget buildExperienceCard(Map<String, dynamic> exp) {
    final title = exp['title'];
    final company = exp['company'];
    final duration = exp['duration'];
    final description = exp['description'];
    final skills = exp['skills'];

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Không tìm thấy tiêu đề',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              company ?? 'Không tìm thấy công ty',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Text(
              duration ?? 'Không tìm thấy thời gian làm việc',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description ?? 'Không tìm thấy mô tả',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: skills.map<Widget>((icon) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FaIcon(
                    icon,
                    size: 18,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
  */
}
