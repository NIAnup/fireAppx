class Pack {
  String icon;
  int coins;

  Pack({
    required this.icon,
    required this.coins,
  });

  factory Pack.fromJson(Map<String, dynamic> json) {
    return Pack(icon: json["icon"], coins: json['coins']);
  }
}
