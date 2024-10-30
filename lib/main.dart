import 'dart:io';
import 'package:flutter/material.dart';
    
void main() {
  UserInfo userInfo = UserInfo(
    name: 'Mansi Patil',
    position: 'Software Developer',
    company: 'Google',
    phone: '(872) 664-2098',
    email: 'mpatil6@hawk.iit.edu',
    address1: '3420 s cottage, LM',
    address2: 'Chicago, IL 60616', 
  ); 
     
  userInfo.addEducation(
    logo: 'assets/images/iitlogo.jpg',
    name: 'Illinois Institute of Technology',
    gpa: 3.66,
    degree: 'MS in CS',
  ); 
  userInfo.addEducation(
    logo: 'assets/images/unilogo.jpeg',
    name: 'Universal College',
    gpa: 4.0,
    degree: 'BE in CS',
  );
 
  userInfo.addProject(ProjectInfo(
    name: 'UI/UX Design',
    description: 'Developed UI/UX design for shopping app using Figma.',
    imageUrl: 'assets/images/p1.png',
  ));
  userInfo.addProject(ProjectInfo(
    name: 'Weather Forecasting',
    description: 'Developed a Weather Forecasting application',
    imageUrl: 'assets/images/p2.png',
  ));
  userInfo.addProject(ProjectInfo(
    name: 'Sentiment Analysis',
    description: 'Developed a web application for sentiment analysis',
    imageUrl: 'assets/images/p3.png',
  ));
  userInfo.addProject(ProjectInfo(
    name: 'A To-do list',
    description: 'Todo List application crafted with React',
    imageUrl: 'assets/images/p4.png',
  ));
  userInfo.addProject(ProjectInfo(
    name: 'Shopping App Figma',
    description: 'Developed UI/UX design for shopping app using Figma.',
    imageUrl: 'assets/images/p1.png',
  ));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: UserInfoPage(userInfo: userInfo)));
}

class UserInfo {
  final String name;
  final String position;
  final String company;
  final String phone;
  final String email;
  final String address1;
  final String address2;

  final List<({String logo, String name, double gpa, String degree})>
      education = [];

  final List<ProjectInfo> projects = [];

  UserInfo({
    required this.name,
    required this.position,
    required this.company,
    required this.phone,
    required this.email,
    required this.address1,
    required this.address2,
  });

  void addEducation(
      {required String logo,
      required String name,
      required double gpa,
      required String degree}) {
    education.add((logo: logo, name: name, gpa: gpa, degree: degree));
  }

  void addProject(ProjectInfo project) {
    projects.add(project);
  }
}

class ProjectInfo {
  final String name;
  final String description;
  final String imageUrl;

  ProjectInfo(
      {required this.name, required this.description, required this.imageUrl});
}

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userInfo.name),
        backgroundColor: const Color.fromARGB(255, 226, 226, 231),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(userInfo: userInfo),
              const SizedBox(height: 20), // Add space between sections
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color.fromARGB(255, 226, 226, 231),
                child: ContactSection(userInfo: userInfo),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color.fromARGB(255, 226, 226, 231),
                child: EducationSection(education: userInfo.education),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color.fromARGB(255, 226, 226, 231),
                child: ProjectsSection(projects: userInfo.projects),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final UserInfo userInfo;

  const HeaderSection({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 226, 226, 231),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfo.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  userInfo.position,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  userInfo.company,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  final UserInfo userInfo;

  const ContactSection({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ContactTile(icon: Icons.phone, text: userInfo.phone),
          ContactTile(icon: Icons.email, text: userInfo.email),
          ContactTile(
              icon: Icons.location_on,
              text: '${userInfo.address1}\n${userInfo.address2}'),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactTile({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      contentPadding: EdgeInsets.zero,
    );
  }
}

class EducationSection extends StatelessWidget {
  final List<({String logo, String name, double gpa, String degree})> education;

  const EducationSection({Key? key, required this.education}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Education',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...education.map((edu) => EducationTile(education: edu)),
        ],
      ),
    );
  }
}

class EducationTile extends StatelessWidget {
  final ({String logo, String name, double gpa, String degree}) education;

  const EducationTile({Key? key, required this.education}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 226, 226, 231),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(education.logo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(education.name, style: const TextStyle(fontSize: 18)),
                  Text(
                      '${education.degree}                    ${education.gpa} GPA'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final List<ProjectInfo> projects;

  const ProjectsSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LayoutBuilder(
              builder: (context, constraints) {
                // Set dynamic column count based on screen width
                int crossAxisCount = (screenWidth < 600)
                    ? 2
                    : (screenWidth < 900)
                        ? 3
                        : 4;

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5), // Adjust this to fit screen
                  ),
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectInfo project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust card height based on screen size
    final double cardHeight = (screenWidth < 600) ? 100 : 120;

    return Card(
      elevation: 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardHeight, // Adjust height dynamically
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 226, 226, 231),
                image: DecorationImage(
                  image: AssetImage(project.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                project.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                project.description,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
