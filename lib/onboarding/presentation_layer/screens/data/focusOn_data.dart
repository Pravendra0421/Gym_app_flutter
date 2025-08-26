// lib/modules/onboarding/presentation_layer/screens/data/body_type_data.dart

class FocusOnOption {
  final String id;
  final String title;

  FocusOnOption({
    required this.id,
    required this.title
  });
}

// Male options ki list
final List<FocusOnOption> maleTypes = [
  FocusOnOption(
    id: 'Visible Abs',
    title: 'Visible Abs',
  ),
  FocusOnOption(
    id: 'Defined Chest',
    title: 'Defined Chest',
  ),
  FocusOnOption(
    id: 'Big Arms',
    title: 'Big Arms',
  ),
  FocusOnOption(
    id: 'Broad Shoulder',
    title: 'Broad Shoulder',
  ),
  FocusOnOption(
    id: 'Wide Back',
    title: 'Wide Back',
  ),
  FocusOnOption(
    id: 'Strong Legs',
    title: 'Strong Legs',
  ),
];

// Female options ki list
final List<FocusOnOption> femaleTypes = [
  FocusOnOption(
    id: 'Flat Belly',
    title: 'Flat Belly',
  ),
  FocusOnOption(
    id: 'Slim Legs',
    title: 'Slim Legs',
  ),
  FocusOnOption(
    id: 'Firm Butt',
    title: 'Firm Butt',
  ),
  FocusOnOption(
    id: 'Round Butt',
    title: 'Round Butt',
  ),
  FocusOnOption(
    id: 'Toned Arms',
    title: 'Toned Arms',
  ),
  FocusOnOption(
    id: 'Strong Back',
    title: 'Strong Back',
  ),
];
