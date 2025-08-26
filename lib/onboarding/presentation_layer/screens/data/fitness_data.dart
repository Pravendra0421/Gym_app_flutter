class fitnessOption {
  final String id;
  final String title;

  fitnessOption({
    required this.id,
    required this.title,
  });
}
final List<fitnessOption> fitnessOptions=[
  fitnessOption(
      id: 'MORE_FIT',
      title: "I'm very fit"
  ),
  fitnessOption(
      id: 'FIT ',
      title: "I'm fit"
  ),
  fitnessOption(
      id: 'NOT_FIT',
      title: "I'm not very fit"
  ),
];