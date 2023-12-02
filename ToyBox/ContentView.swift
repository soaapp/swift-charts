//
//  ContentView.swift
//  ToyBox
//
//  Created by Jay Jahanzad on 2023-12-01.
//

import SwiftUI
import Charts

var data: [ToyShape] = [
    .init(color: "Green", type: "Cube", count: 2),
    .init(color: "Green", type: "Sphere", count: 0),
    .init(color: "Green", type: "Pyramid", count: 1),
    .init(color: "Purple", type: "Cube", count: 1),
    .init(color: "Purple", type: "Sphere", count: 1),
    .init(color: "Purple", type: "Pyramid", count: 1),
    .init(color: "Pink", type: "Cube", count: 1),
    .init(color: "Pink", type: "Sphere", count: 2),
    .init(color: "Pink", type: "Pyramid", count: 0),
    .init(color: "Yellow", type: "Cube", count: 1),
    .init(color: "Yellow", type: "Sphere", count: 1),
    .init(color: "Yellow", type: "Pyramid", count: 2)
]

struct ContentView: View {
    var body: some View {
        Text("Toy Box SwiftUI Charts")
        Chart {
            ForEach(data) {item in
                BarMark(
                    x: .value("Shape Type", item.type),
                    y: .value("Total Count", item.count)
                )
                .foregroundStyle(by: .value("Shape Color", item.color))
            }
        }
        .padding()
        .chartForegroundStyleScale([
            "Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow
        ])
    }
}

#Preview {
    ContentView()
}


struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}
