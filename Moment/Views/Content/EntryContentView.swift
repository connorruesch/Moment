//
//  EntryContentView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI

struct EntryContentView: View {
    @Environment(\.dismiss) var dismiss
    @State var isPresented: Bool = false
    
    var entry: Entry
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                entry.background.view()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        GlassView(cornerRadius: 15) {
                            VStack(alignment: .leading, spacing: 15) {
                                Text(entry.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Divider()
                                    .background(.white)
                                
                                HStack {
                                    Image(systemName: "calendar")
                                    Text("Created on \(entry.date, style: .date)")
                                }
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.secondary)
                                
                                Divider()
                                    .background(.white)
                                
                                Text(entry.content)
                            }
                        }
                        
                        GlassView(cornerRadius: 15) {
                            VStack(alignment: .leading, spacing: 15) {
                                SectionTitle(systemName: "star", title: "THIS DAY'S MOMENT")
                                
                                AsyncImage(url: URL(string: entry.newsImage)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.white
                                }
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 15))
                                
                                Text(entry.newsHeadline)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("From \(entry.newsSource)")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(10)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CircularGlassIconView(systemName: "xmark") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                    } label: {
                        CircularGlassIconView(systemName: "ellipsis") {
                            // do nothing
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $isPresented) {
                ModifyEntryView(entry: entry)
                    .presentationBackground(.ultraThinMaterial)
            }
        }
    }
}
