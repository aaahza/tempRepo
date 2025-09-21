import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/models/experience_model.dart';

class PortfolioData {
  static const String name = 'ASA';
  static const String surname = 'SINGH';
  static const String tagline =
      'Final-year Computer Science student dedicated to building clean, effective, and high-impact software';
  static const String location = 'Based in\nNew Delhi, India';
  static const String email = 'asa22113@iiitd.ac.in';
  static const String collaborateText = 'Let\'s Collaborate';
  static const String copyright = '© ASA SINGH 2025';
  static const String profileImagePath = 'images/pfp.jpeg';

  // About section content
  static const String aboutMainText =
      'I enjoy taking ideas from concept to reality, with experience spanning from academic AI research to deploying software for large-scale, real-world impact';
  static const String aboutSkills = 'Product Development\nUX/UI & Design';

  static const List<String> aboutDescriptions = [
    'I\'m a final-year Computer Science student driven to create software that makes a tangible difference. With a strong skill set in Python and C++, I enjoy tackling projects that are both technically challenging and socially impactful.',
    'My professional experience includes developing a computer vision SDK for a government application impacting over 90 million users , where I focused on performance and cost optimization. In my research role, I\'m exploring novel AI techniques for biomechanical analysis and feedback.',
    'IIIT Delhi has been instrumental in shaping my approach to problem-solving. I\'ve learned to ground my practical development in solid theoretical principles.',
    'Beyond coding, I\'m a dedicated member of my college basketball team and previously coordinated our Philosophy Club.',
  ];

  // Navigation items
  static const List<String> navigationItems = [
    'ABOUT',
    'EXPERIENCE',
    'PROJECTS',
    'CONTACT',
  ];

  // Social links
  static const Map<String, String> socialLinks = {
    'GitHub': 'https://github.com/aaahza',
    'LinkedIn': 'https://www.linkedin.com/in/asa-singh',
  };

  // Experience data
  static const List<Experience> experiences = [
    Experience(
      company: 'Mélange Research Lab, IIITD — in collaboration with NeGD',
      subtitle: 'National e-Governance Division, Govt. of India',
      position: 'Software Development Intern',
      duration: 'July 2025 - Present',
      location: 'New Delhi, India',
      industry: 'Research & GovTech',
      websiteText: 'https://www.negd.gov.in',
      websiteUrl: 'https://www.negd.gov.in',
      descriptions: [
        'Built and delivered a computer vision-based Kotlin SDK for the Government of India\'s Poshan Tracker application to automate attendance for over 90 million beneficiaries.',
        'Architected an on-device CV pipeline that is projected to reduce monthly operational cloud costs by over 80% and developed a React Native bridge for seamless integration.',
      ],
    ),

    Experience(
      company: 'Graphics Research Group, IIITD',
      subtitle: 'Computer Vision & Graphics Research',
      position: 'Undergraduate Researcher',
      duration: 'Dec 2024 - Present',
      location: 'New Delhi, India',
      industry: 'Research',
      websiteText: 'https://graphics.iiitd.edu.in',
      websiteUrl: 'https://graphics.iiitd.edu.in/',
      descriptions: [
        'Leading the development of a novel Physiotherapy system that provides real-time corrective feedback on exercise form by analyzing biomechanical data.',
        'Engineered and trained deep learning models, including a 16-layer Transformer and a Conditional VAE, on large-scale datasets like MINT and AMASS to predict and map human motion.',
      ],
    ),
  ];

  // Projects data
  static const List<Project> projects = [
    Project(
      title: 'Surface Reconstruction',
      category: 'Computer Graphics, C++',
      year: '2024',
      descriptions: [
        'Developed a custom 3D surface reconstruction pipeline from scratch in C++ using the CGAL library.',
        'The system is capable of accurately generating 3D surfaces from complex networks of over 500 non-parallel curves and renders them interactively using OpenGL at over 60 FPS.',
      ],
      linkText: 'View on Github',
      linkUrl: 'https://github.com/rahisenpai/surface-reconstruction',
      imagePaths: ['images/pellip1.jpg', 'images/pellip2.jpg', 'images/s1.jpg', 'images/s2.jpg'], // single image example
    ),
    Project(
      title: 'Vision-Based Football Analytics System',
      category: 'Computer Vision, Machine Learning, Python',
      year: '2025',
      descriptions: [
        'Co-developed a full-stack system to provide automated tactical analysis from football match videos, using a fine-tuned YOLOv8 model that achieved a 0.912 mAP@50 for object detection.',
        'The pipeline uses ByteTrack for multi-object tracking and homography estimation to map player movements onto a 2D tactical pitch view.',
        'Architected an asynchronous backend with Flask and Celery to manage the computationally intensive video processing, delivering final analytics like player speed and distance covered to a web interface.',
      ],
      linkText: 'View on GitHub',
      linkUrl: 'https://github.com/aaahza',
      imagePaths: [
        'images/2d.jpg',
        'images/placeholder_detection.jpg', // example second image
      ],
    ),
  ];
}
