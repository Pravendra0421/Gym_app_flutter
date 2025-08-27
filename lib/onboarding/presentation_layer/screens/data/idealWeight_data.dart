class IdealWeightOption {
  final String id;
  final String title;

  IdealWeightOption({
    required this.id,
    required this.title,
  });
}
final List<IdealWeightOption> IdealWeightOptions=[
  IdealWeightOption(
      id: 'Less_than_one',
      title: "Less than a year ago"
  ),
  IdealWeightOption(
      id: 'One-two-year',
      title: "1-2 years ago"
  ),
  IdealWeightOption(
      id: 'More_than_two',
      title: "More than 2 years ago"
  ),
  IdealWeightOption(
      id: 'Never',
      title: "Never"
  ),
];