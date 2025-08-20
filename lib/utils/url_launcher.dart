import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncher {
  static Future<void> launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/asa-singh';
    if (!await url_launcher.launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchEmail() async {
    const url = 'mailto:asa22113@iiitd.ac.in';
    if (!await url_launcher.launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchGraphicsGroup() async {
    const url = 'https://graphics.iiitd.edu.in/';
    if (!await url_launcher.launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchGithub() async {
    const url = 'https://github.com/aaahza';
    if (!await url_launcher.launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchProject() async {
    const url = 'https://www.project.com';
    if (!await url_launcher.launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchCustomUrl(String url) async {
    if (!await url_launcher.launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
