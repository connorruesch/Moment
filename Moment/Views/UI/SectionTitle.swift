//
//  SectionTitle.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct SectionTitle: View {
    let systemName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
            Text(title)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
    }
}
