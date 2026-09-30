import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ====== EDIT YOUR DETAILS HERE ======
const name = 'Mohd Ali Ansari';
const role = 'Data Analyst & AI/ML';
const tagline =
    'I turn messy data into clear decisions and build machine learning models that ship.';
const about =
    'I am a data analyst focused on analytics, visualization and machine learning. '
    'I enjoy cleaning data, finding patterns, and turning them into dashboards and models '
    'that people can actually use.';
const email = 'youremail@example.com';
const github = 'https://github.com/yourusername';
const linkedin = 'https://linkedin.com/in/yourusername';

const skills = <String>[
  'Python', 'SQL', 'Pandas', 'NumPy', 'Scikit-learn', 'TensorFlow',
  'Power BI', 'Tableau', 'Excel', 'Statistics', 'Flutter', 'Kotlin',
];

const projects = <Project>[
  Project('Sales Dashboard', 'Interactive Power BI dashboard tracking revenue, regions and trends.',
      ['Power BI', 'SQL'], ''),
  Project('Churn Prediction', 'ML model that predicts customer churn with feature engineering and tuning.',
      ['Python', 'Scikit-learn'], ''),
  Project('Sentiment Analysis', 'NLP pipeline that classifies reviews as positive, neutral or negative.',
      ['Python', 'TensorFlow'], ''),
];
// =====================================

class Project {
  final String title, description, link;
  final List<String> tags;
  const Project(this.title, this.description, this.tags, this.link);
}

const bg = Color(0xFF0A0F0D);
const surface = Color(0xFF111A16);
const accent = Color(0xFF3DDC97);
const muted = Color(0xFF8FA39A);

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$name | $role',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(primary: accent, surface: surface),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(4, (_) => GlobalKey());
    void go(int i) => Scrollable.ensureVisible(keys[i].currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          NavBar(onTap: go),
          const Hero(),
          Section(key: keys[0], title: 'About', child: const AboutBlock()),
          Section(key: keys[1], title: 'Skills', child: const SkillsBlock()),
          Section(key: keys[2], title: 'Projects', child: const ProjectsBlock()),
          Section(key: keys[3], title: 'Contact', child: const ContactBlock()),
          const Padding(
            padding: EdgeInsets.all(32),
            child: Text('© $name', style: TextStyle(color: muted)),
          ),
        ]),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final void Function(int) onTap;
  const NavBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 700;
    const items = ['About', 'Skills', 'Projects', 'Contact'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(children: [
        Text('Mohd Ali',
            style: GoogleFonts.spaceGrotesk(
                fontSize: 20, fontWeight: FontWeight.w700, color: accent)),
        const Spacer(),
        if (wide)
          for (var i = 0; i < items.length; i++)
            TextButton(
              onPressed: () => onTap(i),
              child: Text(items[i], style: const TextStyle(color: muted)),
            ),
      ]),
    );
  }
}

class Hero extends StatelessWidget {
  const Hero({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 700;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wide ? 96 : 24, vertical: wide ? 100 : 56),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name,
                style: GoogleFonts.spaceGrotesk(
                    fontSize: wide ? 64 : 40, fontWeight: FontWeight.w700, height: 1.05)),
            const SizedBox(height: 12),
            Text(role,
                style: GoogleFonts.spaceGrotesk(fontSize: wide ? 28 : 20, color: accent)),
            const SizedBox(height: 20),
            const Text(tagline, style: TextStyle(fontSize: 18, color: muted, height: 1.5)),
            const SizedBox(height: 32),
            Wrap(spacing: 12, runSpacing: 12, children: [
              FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: accent, foregroundColor: bg,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
                onPressed: () => _open('mailto:$email'),
                child: const Text('Contact me'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: accent,
                    side: const BorderSide(color: accent),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
                onPressed: () => _open(github),
                child: const Text('View GitHub'),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget child;
  const Section({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 700;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wide ? 96 : 24, vertical: 48),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: GoogleFonts.spaceGrotesk(fontSize: 32, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Container(width: 48, height: 3, color: accent),
            const SizedBox(height: 28),
            child,
          ]),
        ),
      ),
    );
  }
}

class AboutBlock extends StatelessWidget {
  const AboutBlock({super.key});
  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 680),
        child: Text(about, style: TextStyle(fontSize: 17, color: muted, height: 1.7)),
      );
}

class SkillsBlock extends StatelessWidget {
  const SkillsBlock({super.key});
  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [for (final s in skills) Chip2(s)],
      );
}

class Chip2 extends StatelessWidget {
  final String label;
  const Chip2(this.label, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: accent.withOpacity(0.35)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 14)),
      );
}

class ProjectsBlock extends StatelessWidget {
  const ProjectsBlock({super.key});
  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 20, runSpacing: 20, children: [
      for (final p in projects)
        SizedBox(
          width: 310,
          child: Card(
            color: surface,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: accent.withOpacity(0.2))),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: p.link.isEmpty ? null : () => _open(p.link),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(p.title,
                      style: GoogleFonts.spaceGrotesk(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Text(p.description,
                      style: const TextStyle(color: muted, height: 1.5)),
                  const SizedBox(height: 16),
                  Wrap(spacing: 8, runSpacing: 6, children: [
                    for (final t in p.tags)
                      Text(t, style: const TextStyle(color: accent, fontSize: 13)),
                  ]),
                ]),
              ),
            ),
          ),
        ),
    ]);
  }
}

class ContactBlock extends StatelessWidget {
  const ContactBlock({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Open to data analyst and AI/ML roles. Send me a message.',
              style: TextStyle(color: muted, fontSize: 17)),
          const SizedBox(height: 16),
          Wrap(spacing: 8, children: [
            TextButton(onPressed: () => _open('mailto:$email'), child: const Text('Email')),
            TextButton(onPressed: () => _open(github), child: const Text('GitHub')),
            TextButton(onPressed: () => _open(linkedin), child: const Text('LinkedIn')),
          ]),
        ],
      );
}

Future<void> _open(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
