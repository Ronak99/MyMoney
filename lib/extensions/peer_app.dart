enum PeerApp {
  myMoney,
}

extension PeerAppExtension on PeerApp {
  String get name => switch(this) {
    PeerApp.myMoney => "My Money",
  };
}