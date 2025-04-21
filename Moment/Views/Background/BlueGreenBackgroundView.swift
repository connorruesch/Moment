//
//  BlueGreenBackgroundView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct BlueGreenBackgroundView: View {
    var body: some View {
        MeshGradient(width: 3, height: 3, points: [
            .init(0, 0), .init(0.5, 0), .init(1, 0),
            .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
            .init(0, 1), .init(0.5, 1), .init(1, 1)
        ], colors: [
            .green.opacity(0.3), .blue.opacity(0.3), .blue.opacity(0.3),
            .green.opacity(0.3), .blue.opacity(0.3), .blue.opacity(0.3),
            .blue.opacity(0.3), .green.opacity(0.3), .green.opacity(0.3)
        ])
        .ignoresSafeArea(.all)
    }
}
