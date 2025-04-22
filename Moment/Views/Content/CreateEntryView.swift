//
//  CreateEntryView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI
import SwiftData

struct CreateEntryView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var content: String = ""
    @State var background: Background = .blueGreen
    
    @State var newsHeadline: String = ""
    @State var newsImage: String = ""
    @State var newsSource: String = ""
    
    private func validateTitle() -> Bool {
        guard title.trimmingCharacters(in: .whitespaces).count < 20 else {
            return false
        }
        
        return true
    }
    
    private func attachNewsInformation() {
        Task {
            do {
                let res: NewsResponse = try await NewsService.fetchNews()
                let headline = res.articles[0].title
                let image = res.articles[0].urlToImage
                let source = res.articles[0].source.name
                
                newsHeadline = headline ?? "No Headline"
                newsImage = image ?? "No Image"
                newsSource = source ?? "No Source"
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    var body: some View {
        NavigationStack() {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    SectionTitle(systemName: "sparkles", title: "AMBIANCE")
                    
                    GlassView(cornerRadius: 15) {
                        HStack {
                            ForEach(Background.allCases, id: \.self) { choice in
                                if(background == choice) {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(choice.color().opacity(0.5))
                                        .overlay {
                                            Image(systemName: "checkmark")
                                        }
                                } else {
                                    Button {
                                        background = choice
                                    } label: {
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundStyle(choice.color())
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    
                    SectionTitle(systemName: "pencil", title: "ENTRY TITLE")
                    
                    GlassView(cornerRadius: 15) {
                        TextField("Entry Title", text: $title)
                    }
                    
                    SectionTitle(systemName: "text.document", title: "ENTRY TEXT")
                    
                    GlassView(cornerRadius: 15) {
                        TextField("Entry Content", text: $content, axis: .vertical)
                        .multilineTextAlignment(.leading)
                        .frame(height: 200, alignment: .top)
                    }
                }
                .padding()
                .navigationTitle("Create Entry")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        SmallGlassButtonView(label: "Cancel") {
                            dismiss()
                        }
                    }
                }
                
                VStack {
                    if(validateTitle() == false) {
                        Text("Title is too many characters!")
                            .foregroundStyle(.red)
                    }
                    
                    LargeGlassButtonView(label: "Create") {
                        let entry = Entry(title: title,
                                          content: content,
                                          background: background,
                                          newsHeadline: newsHeadline,
                                          newsImage: newsImage,
                                          newsSource: newsSource)
                        context.insert(entry)
                        dismiss()
                    }
                    .disabled(!validateTitle())
                }
                .padding(.top, 20)
            }
            
            Spacer()
        }
        .onAppear {
            attachNewsInformation()
        }
    }
}

#Preview {
    CreateEntryView()
}
