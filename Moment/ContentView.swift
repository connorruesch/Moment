//
//  ContentView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var content
    @Query var entries: [Entry]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                HomeBackgroundView()
                
                VStack {
                    ScrollView {
                        VStack(spacing: 15) {
                            if(entries.isEmpty) {
                                NoEntriesView()
                            } else {
                                ForEach(entries) { entry in
                                    EntryListRowView(entry: entry)
                                }
                            }
                        }
                        .padding(.top, 10)
                    }
                    .mask {
                        Rectangle()
                            .overlay(alignment: .bottom) {
                                LinearGradient(colors: [.black, .clear], startPoint: UnitPoint(x: 0.5, y: 1), endPoint: UnitPoint(x: 0.5, y: 0))
                                    .frame(height: 350)
                                    .frame(maxWidth: .infinity)
                                    .blendMode(.destinationOut)
                            }
                    }
                }
                .padding(.horizontal, 10)
                            
                CreateNewButtonView()
            }
            .navigationTitle("Your Journal")
        }
    }
}

#Preview {
    ContentView()
}
