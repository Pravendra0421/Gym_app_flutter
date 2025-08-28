class CommitUpOption {
  final String id;
  final String title;

  CommitUpOption({
    required this.id,
    required this.title,
  });
}
final List<CommitUpOption> CommitUpOptions=[
  CommitUpOption(
      id: 'At least a year',
      title: "At least a year"
  ),
  CommitUpOption(
      id: 'At least 3 month',
      title: "At least 3 month"
  ),
  CommitUpOption(
      id: 'At least a month',
      title: "At least a month"
  ),
];