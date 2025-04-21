//
//  SmallGlassButtonView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct SmallGlassButtonView: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .frame(width: 75, height: 30)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .cornerRadius(30)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
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
                }
        }
    }
}

#Preview {
    SmallGlassButtonView(label: "Preview") {
        // do nothing
    }
}
