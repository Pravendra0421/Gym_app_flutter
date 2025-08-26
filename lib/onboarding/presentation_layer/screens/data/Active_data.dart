class ActiveOption {
  final String id;
  final String title;

  ActiveOption({
    required this.id,
    required this.title,
  });
}
final List<ActiveOption> activeOptions=[
  ActiveOption(
      id: 'NOT_ACTIVE',
      title: "Not active"
  ),
  ActiveOption(
      id: 'LIGHT_ACTIVE',
      title: "Lightly active"
  ),
  ActiveOption(
      id: 'MODERATE_ACTIVE',
      title: "Moderately active"
  ),
  ActiveOption(
      id: 'HIGHLY_ACTIVE',
      title: "Highly active"
  ),
];