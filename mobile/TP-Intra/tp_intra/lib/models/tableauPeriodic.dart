import 'package:flutter/material.dart';
import 'package:tp_intra/main.dart';

class Elements {
  var name;
  var appearance;
  var atomicMass;
  var boil;
  var category;
  var density;
  var discoveredBy;
  var melt;
  var molarHeat;
  var namedBy;
  var number;
  var period;
  var phase;
  var source;
  var spectralImg;
  var summary;
  var symbol;
  var xpos;
  var ypos;
  var shells;
  var electronConfiguration;
  var electronConfigurationSemantic;
  var electronAffinity;
  var electronegativityPauling;
  var ionizationEnergies;
  var cpkHex;

  Elements(Map<String, dynamic> json) {
    name = json['name'];
    appearance = json['appearance'];
    atomicMass = json['atomic_mass'];
    boil = json['boil'];
    category = json['category'];
    density = json['density'];
    discoveredBy = json['discovered_by'];
    melt = json['melt'];
    molarHeat = json['molar_heat'];
    namedBy = json['named_by'];
    number = json['number'];
    period = json['period'];
    phase = json['phase'];
    source = json['source'];
    spectralImg = json['spectral_img'];
    summary = json['summary'];
    symbol = json['symbol'];
    xpos = json['xpos'];
    ypos = json['ypos'];
    shells = json['shells'].cast<int>();
    electronConfiguration = json['electron_configuration'];
    electronConfigurationSemantic = json['electron_configuration_semantic'];
    electronAffinity = json['electron_affinity'];
    electronegativityPauling = json['electronegativity_pauling'];
    ionizationEnergies = json['ionization_energies'].cast<int>();
    cpkHex = json['cpk-hex'];
  }

  Color getColor() {
    if (cpkHex.toString() != "null") {
      return Color(int.parse("0x" + cpkHex.toString()));
    } else {
      return Color(0);
    }
  }

  Expanded getDetails() {
    final detail = Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Text(
          summary,
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
    return detail;
  }
}
