//
//  ContentView.swift
//  DiveApp
//
//  Created by Kirk Hietpas on 12/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var oxygenPercent = 21.0;
    @State private var isEditing = false;
    var body: some View {
        Text("% oxygen \(oxygenPercent)")
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
