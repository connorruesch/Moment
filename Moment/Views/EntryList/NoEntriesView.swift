//
//  NoEntriesView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct NoEntriesView: View {
    var body: some View {
        GlassView(cornerRadius: 20) {
            VStack(spacing: 15) {
                Image(systemName: "book.and.wrench.fill")
                    .font(.system(size: 50))
                    .padding(.top, 10)
                
                Text("No Entries Found")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Looks like you don't have any entries yet. Click 'Create New' below to create one.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
            }
        }
    }
}
