//
//  ContentView.swift
//  DiveApp
//
//  Created by Kirk Hietpas on 12/3/22.
//

import SwiftUI

struct ContentView: View {
    // 1.4, contigency is 1.6. (relative % oxyagen)
    @State private var maxPPG = 1.4;
    @State private var contigencyPPG = 1.6;
    @State private var Depth = 0; // measured in ATA
    @State private var FG = 0; // fraction of oxygen, air is 21%
    @State private var oxygenPercent = 21.0;
    @State private var isEditing = false;
    public var maxDepthFt = 0.0;
    public var maxDepthM = 0.0;
    var body: some View {
            
        
        Text("Max depth with % oxygen \(oxygenPercent) is \(maxDepthFt) ft, \(maxDepthM) M")
            .padding()
        Slider(
            value: $oxygenPercent,
            in: 0...100,
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
