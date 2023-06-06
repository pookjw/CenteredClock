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
                setStatusBarPlacement(.centered)
            }
            label: {
                Text(_NSStringFromPUICStatusBarPlacement(.centered))
            }
            
            Button {
                setStatusBarPlacement(.trailing)
            }
            label: {
                Text(_NSStringFromPUICStatusBarPlacement(.trailing))
            }
        }
    }
}

#Preview {
    ContentView()
}
