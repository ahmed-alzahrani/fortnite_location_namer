import 'Words.dart';

class LocationGenerator {

  LocationGenerator();

  Words words = new Words();

  List<String> generateTenLocations() {
    List<String> locations = new List();
    for (int i = 0; i < 10; i++) {
      locations.add(generateLocation());
    }
    return locations;
  }

  String generateLocation() {
    List<String> locations = words.getLocationWords();
    locations.shuffle();
    String location = locations[0];
    String adjective = getAdjective(location[0]);
    String value = adjective + " " + location;
    return value;
  }

  String getAdjective(String char) {
    List<String> adjectives;

    switch(char) {
      case "A": { adjectives = words.getAWords(); }
      break;

      case "B": { adjectives = words.getBWords(); }
      break;

      case "C": { adjectives = words.getCWords(); }
      break;

      case "D": { adjectives = words.getDWords(); }
      break;

      case "E": { adjectives = words.getEWords(); }
      break;

      case "F": { adjectives = words.getFWords(); }
      break;

      case "G": { adjectives = words.getGWords(); }
      break;

      case "H": { adjectives = words.getHWords(); }
      break;

      case "I": { adjectives = words.getIWords(); }
      break;

      case "J": { adjectives = words.getJWords(); }
      break;

      case "L": { adjectives = words.getLWords(); }
      break;

      case "M": { adjectives = words.getMWords(); }
      break;

      case "P": { adjectives = words.getPWords(); }
      break;

      case "R": { adjectives = words.getRWords(); }
      break;

      case "S": { adjectives = words.getSWords(); }
      break;

      case "T": { adjectives = words.getTWords(); }
      break;

      case "V": { adjectives = words.getVWords(); }
      break;

      case "W": { adjectives = words.getWWords(); }
      break;

      case "Y": { adjectives = words.getYWords(); }
      break;
    }

    adjectives.shuffle();
    return adjectives[0];
  }

}