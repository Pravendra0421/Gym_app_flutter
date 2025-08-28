
class WorkOutOption {
  final String id;
  final String title;

  WorkOutOption({
    required this.id,
    required this.title
  });
}

// Male options ki list
final List<WorkOutOption> WorkOutOptions = [
  WorkOutOption(
    id: 'At Home',
    title: 'At Home',
  ),
  WorkOutOption(
    id: 'At the gym',
    title: 'At the gym',
  ),
  WorkOutOption(
    id: 'Studio classes',
    title: 'Studio classes',
  ),
  WorkOutOption(
    id: 'Outdoor',
    title: 'Outdoor',
  ),
];

