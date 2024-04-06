import 'package:fireappx/models/pack.dart';
import 'package:fireappx/models/profile.dart';
import 'package:fireappx/models/reward.dart';

class Fireappx {
  Profilemodel profile;
  List<Reward> rewards;
  List<Pack> packs;

  Fireappx({
    required this.profile,
    required this.rewards,
    required this.packs,
  });
}
