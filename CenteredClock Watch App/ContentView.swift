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
                setStatusBarPlacement(.center)
            }
            label: {
                Text("Center")
            }
            
            Button {
                setStatusBarPlacement(.trailing)
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
