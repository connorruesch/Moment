//
//  LargeGlassButtonView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct LargeGlassButtonView: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            GlassView(cornerRadius: 40) {
                Text(label)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .frame(width: 200, height: 50)
        }
    }
}

#Preview {
    LargeGlassButtonView(label: "Preview") {
        // do nothing
    }
}
