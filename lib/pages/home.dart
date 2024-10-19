import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'projects.dart';
import 'experience.dart';
import 'contact.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeContent(),
    ProjectsPage(),
    ExperiencePage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Project',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Kinh nghiệm',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).colorScheme.background,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String githubUrl = 'https://github.com/xxelxt';
  final String kaggleUrl = 'https://www.kaggle.com/xxelxt';
  final String email = '24a4042603@hvnh.edu.vn';
  final String location = 'hanoi, vietnam';
  final String gender = 'he/him';
  final String githubAccount = 'xxelxt';

  static const platform = MethodChannel('com.example.myapp/browser');

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile_image_alt.jpg'),
          ),
          SizedBox(height: 20),
          Text(
            'xxelxt',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'an extraoddinary person.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.github, color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  _openBrowser(githubUrl);
                },
              ),
              SizedBox(width: 16),
              IconButton(
                icon: Icon(FontAwesomeIcons.kaggle, color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  _openBrowser(kaggleUrl);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                InfoCard(icon: FontAwesomeIcons.transgender, text: gender),
                InfoCard(icon: FontAwesomeIcons.mapMarkerAlt, text: location),
                InfoCard(icon: FontAwesomeIcons.envelope, text: email),
                GestureDetector(
                  onTap: () {
                    _openBrowser(githubUrl);
                  },
                  child: InfoCard(icon: FontAwesomeIcons.github, text: githubAccount),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
            icon: Icon(Icons.contact_mail),
            label: Text('Contact me'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoCard({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: FaIcon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}