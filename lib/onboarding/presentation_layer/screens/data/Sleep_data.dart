class SleepOption {
  final String id;
  final String title;

  SleepOption({
    required this.id,
    required this.title,
  });
}
final List<SleepOption> SleepOptions=[
  SleepOption(
      id: 'More_than_Eight',
      title: "More Than Eight Hours"
  ),
  SleepOption(
      id: 'Seven-eight-hours',
      title: "7-8 hours"
  ),
  SleepOption(
      id: 'Six-seven-hours',
      title: "6-7 hours"
  ),
  SleepOption(
      id: 'Less_than_six_hours',
      title: "Less than 6 hours"
  ),
];