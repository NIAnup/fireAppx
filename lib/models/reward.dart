class Reward {
  String icon;
  String title;
  String summary;
  int coins;

  Reward({
    required this.icon,
    required this.title,
    required this.summary,
    required this.coins,
  });
  factory Reward.fromJson(Map<String, dynamic> js) {
    return Reward(
        icon: js['icon'],
        title: js['title'],
        summary: js['summary'],
        coins: js['coins']);
  }
}
