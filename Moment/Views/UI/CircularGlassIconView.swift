//
//  CircularGlassIconView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct CircularGlassIconView: View {
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .fill(LinearGradient(
                    colors: [
                        Color.white.opacity(0.2),
                        Color.white.opacity(0.1),
                        Color.white.opacity(0.1),
                        Color.white.opacity(0.2)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                .frame(width: 30, height: 30)
                .overlay {
                    Image(systemName: systemName)
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                }
        }
    }
}

#Preview {
    CircularGlassIconView(systemName: "xmark") {
        // do nothing
    }
}
