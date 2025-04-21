//
//  Background.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

enum Background: CaseIterable, Codable {
    case blueGreen, pinkMint, purplePink, redOrange
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .redOrange:
            RedOrangeBackgroundView()
        case .blueGreen:
            BlueGreenBackgroundView()
        case .purplePink:
            PurplePinkBackgroundView()
        case .pinkMint:
            PinkMintBackgroundView()
        }
    }
    
    func color() -> Color {
        switch self {
        case .redOrange:
            return Color.orange
        case .blueGreen:
            return Color.green
        case .purplePink:
            return Color.purple
        case .pinkMint:
            return Color.mint
        }
    }
}
