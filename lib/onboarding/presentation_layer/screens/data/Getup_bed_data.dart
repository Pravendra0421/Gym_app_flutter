class GetupOption {
  final String id;
  final String title;

  GetupOption({
    required this.id,
    required this.title,
  });
}
final List<GetupOption> GetupOptions=[
  GetupOption(
      id: 'Less_than_one',
      title: "Less than a year ago"
  ),
  GetupOption(
      id: 'One-two-year',
      title: "1-2 years ago"
  ),
  GetupOption(
      id: 'More_than_two',
      title: "More than 2 years ago"
  ),
  GetupOption(
      id: 'Never',
      title: "Never"
  ),
];