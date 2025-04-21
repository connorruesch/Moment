//
//  EntryListRowView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct EntryListRowView: View {
    @Environment(\.modelContext) private var context
    @Namespace var namespace
    @State var isPresented: Bool = false
    
    var entry: Entry
    
    var body: some View {
        NavigationLink {
            EntryContentView(entry: entry)
                .navigationTransition(.zoom(sourceID: entry.id, in: namespace))
                .navigationBarBackButtonHidden(true)
        } label: {
            GlassView(customBackgroundColor: entry.background.color(), cornerRadius: 15) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(entry.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text("Created \(entry.date, style: .date)")
                        }
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Menu {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        
                        Button(role: .destructive) {
                            context.delete(entry)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    } label: {
                        CircularGlassIconView(systemName: "ellipsis") {
                            // do nothing
                        }
                    }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    ModifyEntryView(entry: entry)
                        .presentationBackground(.ultraThinMaterial)
                }
            }
            .matchedTransitionSource(id: entry.id, in: namespace)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
