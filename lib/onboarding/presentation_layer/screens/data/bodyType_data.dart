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
    id: 'Ectomorph',
    title: 'Ectomorph',
    imagePath: 'assets/images/male_lose.png',
  ),
  BodyTypeOption(
    id: 'Mesomorph',
    title: 'Mesomorph',
    imagePath: 'assets/images/male.png',
  ),
  BodyTypeOption(
    id: 'Endomorph',
    title: 'Endomorph',
    imagePath: 'assets/images/male.png',
  ),
];

// Female options ki list
final List<BodyTypeOption> femaleBodyTypes = [
  BodyTypeOption(
    id: 'Hourglass',
    title: 'Hourglass',
    imagePath: 'assets/images/female.png',
  ),
  BodyTypeOption(
    id: 'Rectangle',
    title: 'Rectangle',
    imagePath: 'assets/images/female.png',
  ),
  BodyTypeOption(
    id: 'Pear',
    title: 'Pear',
    imagePath: 'assets/images/female.png',
  ),
  BodyTypeOption(
    id: 'Round',
    title: 'Round',
    imagePath: 'assets/images/female.png',
  ),
];
