//
//  ModifyEntryView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//
import SwiftUI
import SwiftData

struct ModifyEntryView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @Bindable var entry: Entry
    
    func validateTitle() -> Bool {
        guard entry.title.trimmingCharacters(in: .whitespaces).count < 20 else {
            return false
        }
        
        return true
    }
    
    var body: some View {
        NavigationStack(){
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    SectionTitle(systemName: "sparkles", title: "AMBIANCE")
                    
                    GlassView(cornerRadius: 15) {
                        HStack {
                            ForEach(Background.allCases, id: \.self) { choice in
                                if(entry.background == choice) {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(choice.color().opacity(0.5))
                                        .overlay {
                                            Image(systemName: "checkmark")
                                        }
                                } else {
                                    Button {
                                        entry.background = choice
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
                        TextField("Entry Title", text: $entry.title)
                    }
                    
                    SectionTitle(systemName: "text.document", title: "ENTRY TEXT")
                    
                    GlassView(cornerRadius: 15) {
                        TextField("Entry Content", text: $entry.content, axis: .vertical)
                            .multilineTextAlignment(.leading)
                            .frame(height: 200, alignment: .top)
                    }
                }
                .padding()
                .navigationTitle("Modify Entry")
                
                VStack {
                    if(validateTitle() == false) {
                        Text("Title is too many characters!")
                            .foregroundStyle(.red)
                    }
                    
                    LargeGlassButtonView(label: "Save") {
                        dismiss()
                    }
                    .disabled(!validateTitle())
                }
                .padding(.top, 20)
            }
            Spacer()
        }
    }
}
