class excludeLoudOption {
  final String id;
  final String title;

  excludeLoudOption({
    required this.id,
    required this.title,
  });
}
final List<excludeLoudOption> excludeLoudOptions=[
  excludeLoudOption(
      id: 'Yes, exclude loud exercises',
      title: "Yes, exclude loud exercises"
  ),
  excludeLoudOption(
      id: 'Yes, limit loud exercises',
      title: "Yes, limit loud exercises"
  ),
  excludeLoudOption(
      id: "No, don't exclude loud exercises",
      title: "No, don't exclude loud exercises"
  ),
];