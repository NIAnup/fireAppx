class Profilemodel {
  String name;
  String photo;
  String phone;
  int coins;
  String membership;

  Profilemodel({
    required this.name,
    required this.photo,
    required this.phone,
    required this.coins,
    required this.membership,
  });

  factory Profilemodel.fromJson(Map<String, dynamic> map) {
    return Profilemodel(
        name: map['name'],
        photo: map['photo'],
        phone: map['phone'],
        coins: map['coins'],
        membership: map['membership']);
  }
}
