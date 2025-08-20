import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/models/experience_model.dart';

class PortfolioData {
  static const String name = 'ASA';
  static const String surname = 'SINGH';
  static const String tagline = 'A business-oriented product engineer with 3+ years of experience working in fintech and proptech industries';
  static const String location = 'Based in\nNew Delhi, India';
  static const String email = 'asa22113@iiitd.ac.in';
  static const String collaborateText = 'Let\'s Collaborate';
  static const String copyright = '© ASA SINGH 2025';
  static const String profileImagePath = 'images/pfp.jpeg';
  
  // About section content
  static const String aboutMainText = 'Over the years, I have worked on customer-facing products with a strong focus on excellent user experience and accessibility';
  static const String aboutSkills = 'Product Development\nUX/UI & Design';
  
  static const List<String> aboutDescriptions = [
    'Self-taught software engineer with a strong knowledge of TypeScript, Swift, and Java. I am passionate about working on meaningful projects that have a positive impact on people\'s lives.',
    'I have hands-on experience working on high-traffic, customer-facing products and prioritize building clean, maintainable codebases that enable continuous improvement and scalability.',
    'I hold a Bachelor of Business Administration from Hult International Business School in London and an International Baccalaureate from Leysin American School in Switzerland.',
    'I am fluent in English and Russian and have experience working and studying in an international environment.',
  ];
  
  // Navigation items
  static const List<String> navigationItems = ['ABOUT', 'EXPERIENCE', 'PROJECTS', 'CONTACT'];
  
  // Social links
  static const Map<String, String> socialLinks = {
    'GitHub': 'https://github.com/aaahza',
    'LinkedIn': 'https://www.linkedin.com/in/asa-singh',
  };
  
  // Experience data
  static const List<Experience> experiences = [
    Experience(
      company: 'Graphics Research Group, IIITD',
      subtitle: 'Award winning research lab',
      position: 'Undergraduate Researcher',
      duration: '2024 - Present',
      location: 'New Delhi, India',
      industry: 'Research',
      websiteText: 'https://graphics.iiitd.edu.in',
      websiteUrl: 'https://graphics.iiitd.edu.in/',
      descriptions: [
        'I have worked on and helped design key application features, including authentication, in-app messaging, property details, and a supporting web application.',
        'Crowdhaus was a property discovery application with 25,000+ downloads and 400+ five-star reviews, which allowed users across the United Kingdom to discover homes to buy and rent.',
      ],
    ),
  ];
  
  // Projects data
  static const List<Project> projects = [
    Project(
      title: 'Compound Interest Calculator',
      category: 'Web Development, Design, Idea',
      year: '2024',
      descriptions: [
        'This side project started from my personal interest in the effects of compound interest.',
        'My goal was to create a simple, user-friendly tool that hides all the complexity — something people could use regularly.',
        'The project was developed using TypeScript, React, Vite, and deployed on Cloudflare Pages.',
      ],
      linkText: 'www.project.com',
      linkUrl: 'https://www.project.com',
      imagePath: 'images/pfp.jpeg',
    ),
    Project(
      title: 'Compound Interest Calculator',
      category: 'Web Development, Design, Idea',
      year: '2024',
      descriptions: [
        'This side project started from my personal interest in the effects of compound interest.',
        'My goal was to create a simple, user-friendly tool that hides all the complexity — something people could use regularly.',
        'The project was developed using TypeScript, React, Vite, and deployed on Cloudflare Pages.',
      ],
      linkText: 'www.project.com',
      linkUrl: 'https://www.project.com',
      imagePath: 'images/pfp.jpeg',
    ),
  ];
}
