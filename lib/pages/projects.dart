import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/pages/project_detail.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'TechZone',
      'image': 'assets/images/project_techzone.avif',
      'description': 'Website kinh doanh thiết bị công nghệ',
      'detailedDescription': '',
      'category': 'Lập trình',
      'language': 'PHP, MySQL, Laravel, HTML, CSS, JavaScript. Built on XAMPP',
      'githubUrl': 'https://github.com/xxelxt/tech-zone',
      'logo': [
        FontAwesomeIcons.php,
        FontAwesomeIcons.database,
        FontAwesomeIcons.laravel,
        FontAwesomeIcons.html5,
        FontAwesomeIcons.css3,
        FontAwesomeIcons.js,
      ]
    },
    {
      'title': 'DRIVER-BEHAVIOR',
      'image': 'assets/images/project_ai.avif',
      'description': 'Ứng dụng học sâu trong phát hiện hành vi người điều khiển xe ô tô',
      'detailedDescription': '',
      'category': 'Dữ liệu',
      'language': 'Python',
      'githubUrl': 'https://github.com/xxelxt/driver-behavior',
      'logo': [
        FontAwesomeIcons.python,
      ]
    },
    {
      'title': '100% / BAEK-PERCENT',
      'image': 'assets/images/project_baek.png',
      'description': 'Phần mềm quản lý cửa hàng cho thuê sách truyện (.NET)',
      'detailedDescription': '',
      'category': 'Lập trình',
      'language': 'C#, .NET, SQL Server. UI designed with MaterialSkin2',
      'githubUrl': 'https://github.com/xxelxt/baek-percent',
      'logo': [
        FontAwesomeIcons.c,
        FontAwesomeIcons.database,
      ]
    },
    {
      'title': 'Ding Tea',
      'image': 'assets/images/project_ttcn.webp',
      'description': 'Phân tích thiết kế hệ thống quản lý hoạt động hàng ngày của chuỗi cửa hàng Ding Tea',
      'detailedDescription': '',
      'category': 'Khác',
      'language': 'Figma, Visual Paradigm',
      'logo': [
        FontAwesomeIcons.figma,
        FontAwesomeIcons.sitemap,
      ]
    },
    {
      'title': 'EMP-ATTRITION',
      'image': 'assets/images/project_data.avif',
      'description': 'Dự đoán khả năng gắn bó của nhân sự với công ty ứng dụng khai phá và phân tích dữ liệu',
      'detailedDescription': '',
      'category': 'Dữ liệu',
      'language': 'Python',
      'githubUrl': 'https://github.com/xxelxt/emp-attrition',
      'logo': [
        FontAwesomeIcons.python,
      ]
    },
    {
      'title': 'ORCL-PCBNG',
      'image': 'assets/images/project_oracle.avif',
      'description': 'CSDL tác nghiệp quản lý hoạt động của quán café Internet',
      'detailedDescription': '',
      'category': 'Khác',
      'language': 'Oracle SQL',
      'githubUrl': 'https://github.com/xxelxt/orcl-pcbng',
      'logo': [
        FontAwesomeIcons.database,
      ]
    },
    {
      'title': 'Culture Depot',
      'image': 'assets/images/project_web.webp',
      'description': 'Thiết kế website cho công ty phát hành sách',
      'detailedDescription': '',
      'category': 'Lập trình',
      'language': 'HTML, CSS, JavaScript, Firebase',
      'githubUrl': 'https://github.com/xxelxt/culture-depot',
      'logo': [
        FontAwesomeIcons.html5,
        FontAwesomeIcons.css3,
        FontAwesomeIcons.js,
        FontAwesomeIcons.database,
      ]
    },
    {
      'title': 'LIBRARY',
      'image': 'assets/images/project_java.avif',
      'description': 'Phần mềm quản lý hoạt động thư viện Học viện Ngân hàng',
      'detailedDescription': '',
      'category': 'Lập trình',
      'language': 'Java, MySQL. UI designed with JavaFX SceneBuilder. Built using Gradle',
      'githubUrl': 'https://github.com/xxelxt/library',
      'logo': [
        FontAwesomeIcons.java,
        FontAwesomeIcons.database,
        FontAwesomeIcons.server,
      ]
    },
    {
      'title': 'COFFEE-SHOP',
      'image': 'assets/images/project_c.webp',
      'description': 'Chương trình quản lý và vận hành quán cafe trên terminal',
      'detailedDescription': '',
      'category': 'Lập trình',
      'language': 'C',
      'githubUrl': 'https://github.com/xxelxt/coffee-shop',
      'logo': [
        FontAwesomeIcons.c,
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Map<String, dynamic>> getFilteredProjects(String category) {
    return projects.where((project) => project['category'] == category).toList();
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
                  'Projects',
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
            Tab(text: 'Lập trình'),
            Tab(text: 'Dữ liệu'),
            Tab(text: 'Khác'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            buildProjectListView('Lập trình'),
            buildProjectListView('Dữ liệu'),
            buildProjectListView('Khác'),
          ],
        ),
      ),
    );
  }

  Widget buildProjectListView(String category) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: getFilteredProjects(category).length,
      itemBuilder: (context, index) {
        final proj = getFilteredProjects(category)[index];
        return buildProjectCard(proj);
      },
    );
  }

  Widget buildProjectCard(Map<String, dynamic> proj) {
    final image = proj['image'];
    final title = proj['title'];
    final description = proj['description'];
    final logos = proj['logo'];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailPage(project: proj),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image != null && image.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? 'Không có tiêu đề',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description ?? 'Không có mô tả',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        children: logos.map<Widget>((icon) {
                          return FaIcon(
                            icon,
                            size: 18,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}