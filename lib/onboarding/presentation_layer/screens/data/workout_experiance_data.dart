class WorkoutOption {
  final String id;
  final String title;

  WorkoutOption({
    required this.id,
    required this.title,
  });
}
final List<WorkoutOption> workoutoptions=[
  WorkoutOption(
      id: 'YES_REGULARLY',
      title: 'Yes, I work out regularly'
  ),
  WorkoutOption(
      id: 'YES_LESS',
      title: 'Yes, less than a year ago'
  ),
  WorkoutOption(
      id: 'YES_MORE',
      title: 'Yes, more than 1 year ago'
  ),
  WorkoutOption(
      id: 'now',
      title: "No, I don't have any"
  ),
];