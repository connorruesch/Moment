//
//  GlassView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct GlassView<Content: View>: View {
    let reflectiveGradientColors: [Color]
    let cornerRadius: CGFloat
    var content: () -> Content
    
    let borderColor: Color = Color.white.opacity(0.3)
    
    init(cornerRadius: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.reflectiveGradientColors = [
            Color.white.opacity(0.3),
            Color.white.opacity(0.2),
            Color.white.opacity(0.2),
            Color.white.opacity(0.3)
        ]
        self.cornerRadius = cornerRadius
        self.content = content
    }
    
    init(customBackgroundColor: Color, cornerRadius: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.reflectiveGradientColors = [
            customBackgroundColor.opacity(0.4),
            Color.white.opacity(0.1),
            Color.white.opacity(0.1),
            Color.white.opacity(0.2)
        ]
        self.cornerRadius = cornerRadius
        self.content = content
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(LinearGradient(
                        colors: reflectiveGradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .stroke(borderColor, lineWidth: 1)
            }
    }
}
