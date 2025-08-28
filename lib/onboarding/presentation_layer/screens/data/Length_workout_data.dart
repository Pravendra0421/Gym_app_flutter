class LengthWorkoutOption {
  final int id;
  final String title;

  LengthWorkoutOption({
    required this.id,
    required this.title,
  });
}
final List<LengthWorkoutOption> LengthWorkoutOptions=[
  LengthWorkoutOption(
      id: 15,
      title: "Short,10-15 min"
  ),
  LengthWorkoutOption(
      id: 25,
      title: "Medium, 15-25 min"
  ),
  LengthWorkoutOption(
      id: 40,
      title: "Long, 25-40 min"
  ),
];