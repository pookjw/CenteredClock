//
//  ContentView.swift
//  CenteredClock Watch App
//
//  Created by Jinwoo Kim on 6/6/23.
//

import SwiftUI

extension PUICStatusBarPlacement: CaseIterable, Identifiable {
    public static let allCases: [PUICStatusBarPlacement] = [.trailing, .centered]
    
    public var id: UInt {
        rawValue
    }
}

struct ContentView: View {
    var body: some View {
        List(PUICStatusBarPlacement.allCases) { placement in
            Button {
                setStatusBarPlacement(placement)
            }
            label: {
                switch placement {
                case .trailing:
                    Label(_NSStringFromPUICStatusBarPlacement(placement), systemImage: "text.justify.trailing")
                case .centered:
                    Label(_NSStringFromPUICStatusBarPlacement(placement), systemImage: "text.aligncenter")
                @unknown default:
                    fatalError()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
