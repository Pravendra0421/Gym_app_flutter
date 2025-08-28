class PlanPaceOption {
  final String id;
  final String title;

  PlanPaceOption({
    required this.id,
    required this.title,
  });
}
final List<PlanPaceOption> PlanPaceOptions=[
  PlanPaceOption(
      id: 'As fast as possible',
      title: "As fast as possible"
  ),
  PlanPaceOption(
      id: 'Balanced pace',
      title: "Balanced pace"
  ),
  PlanPaceOption(
      id: 'Slowly but steadily',
      title: "Slowly but steadily"
  ),
];