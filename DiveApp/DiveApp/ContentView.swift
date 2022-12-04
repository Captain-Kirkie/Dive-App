//
//  ContentView.swift
//  DiveApp
//
//  Created by Kirk Hietpas on 12/3/22.
//

import SwiftUI

enum Units {
    case feet, metres
}

struct ContentView: View {
    // 1.4, contigency is 1.6. (relative % oxyagen)
    @State private var maxPPG : Float = 1.4;
    @State private var contigencyPPG : Float = 1.6;
    @State private var Depth: Float = 0; // measured in ATA
    @State private var FG: Float = 0; // fraction of oxygen, air is 21%
    @State private var oxygenPercent: Float = 21.0;
    @State private var isEditing = false;
    public var maxDepthFt = 0.0;
    public var maxDepthM = 0.0;
    
    var body: some View {
      
        Text("Max Depth with \(oxygenPercent)% O2 is \(calculateMaxDepthFeet(maxPPG: maxPPG, fractionOxygen: oxygenPercent, unit: Units.feet)) ft").padding();
        
        Text("Max Depth with \(oxygenPercent)% O2 is \(calculateMaxDepthFeet(maxPPG: maxPPG, fractionOxygen: oxygenPercent, unit: Units.metres)) M").padding();
        Slider(
            value: $oxygenPercent,
            in: 21...100,
            onEditingChanged: { editing in
                isEditing = editing
            }
        ).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



func calculateMaxDepthFeet(maxPPG: Float, fractionOxygen : Float , unit: Units) -> Float {
    print("maxPPG \(maxPPG)")
    let pressure = maxPPG / (fractionOxygen / 100);
    print(pressure);
    let guagePressure = pressure - 1;
    var multiply : Float;
    if(unit == Units.feet) {
        multiply = 33;
    } else if (unit == Units.metres) {
        multiply = 10;
    } else {
        multiply = 0;
    }
    return guagePressure * multiply; /// 33 feet += one ata
}
