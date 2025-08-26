// lib/modules/onboarding/presentation_layer/screens/data/body_type_data.dart

class BodyTypeOption {
  final String id;
  final String title;
  final String imagePath;

  BodyTypeOption({
    required this.id,
    required this.title,
    required this.imagePath,
  });
}

// Male options ki list
final List<BodyTypeOption> maleBodyTypes = [
  BodyTypeOption(
    id: 'Athletic',
    title: 'Athletic',
    imagePath: 'assets/images/male_lose.png',
  ),
  BodyTypeOption(
    id: 'Balanced',
    title: 'Balanced',
    imagePath: 'assets/images/male.png',
  ),
  BodyTypeOption(
    id: 'Strong',
    title: 'Strong',
    imagePath: 'assets/images/male.png',
  ),
];

// Female options ki list
final List<BodyTypeOption> femaleBodyTypes = [
  BodyTypeOption(
    id: 'Mine is fine',
    title: 'Mine is fine',
    imagePath: 'assets/images/female.png',
  ),
  BodyTypeOption(
    id: 'Thin',
    title: 'Thin',
    imagePath: 'assets/images/female.png',
  ),
  BodyTypeOption(
    id: 'Toned',
    title: 'Toned',
    imagePath: 'assets/images/female.png',
  ),
  BodyTypeOption(
    id: 'Curvy',
    title: 'Curvy',
    imagePath: 'assets/images/female.png',
  ),
];
