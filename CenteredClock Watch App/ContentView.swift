//
//  ContentView.swift
//  CenteredClock Watch App
//
//  Created by Jinwoo Kim on 6/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var stack = [Int]()
    
    var body: some View {
        VStack {
            Button {
                setStatusBarPlacement(1)
            }
            label: {
                Text("Center")
            }
            
            Button {
                setStatusBarPlacement(0)
            }
            label: {
                Text("Trailing")
            }
        }
    }
}

#Preview {
    ContentView()
}
