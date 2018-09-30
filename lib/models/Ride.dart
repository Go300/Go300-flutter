import 'AppConstants.dart';

class Ride {
  String from;
  String to;
  Ride(this.from, this.to);

  String apiFrom() {
    return _toAPI(from);
  }

  String apiTo() {
    return _toAPI(to);
  }

  String _toAPI(String location) {
    switch (location) {
      case KBTU:
        return API_KBTU;
      case DORMITORY:
        return API_DORMITORY;
      case SPORT:
        return API_SPORT;
      default:
        return "ERROR";
    }
  }
}