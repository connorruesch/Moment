//
//  RedOrangeBackgroundView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct RedOrangeBackgroundView: View {
    var body: some View {
        MeshGradient(width: 3, height: 3, points: [
            .init(0, 0), .init(0.5, 0), .init(1, 0),
            .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
            .init(0, 1), .init(0.5, 1), .init(1, 1)
        ], colors: [
            .orange.opacity(0.3), .red.opacity(0.3), .red.opacity(0.3),
            .orange.opacity(0.3), .red.opacity(0.3), .red.opacity(0.3),
            .red.opacity(0.3), .orange.opacity(0.3), .orange.opacity(0.3)
        ])
        .ignoresSafeArea(.all)
    }
}
