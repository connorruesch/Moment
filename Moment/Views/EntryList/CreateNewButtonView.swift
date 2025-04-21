//
//  CreateNewButtonView.swift
//  Moment
//
//  Created by Connor Ruesch on 4/21/25.
//

import SwiftUI

struct CreateNewButtonView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                .blur(radius: 50)
            
            LargeGlassButtonView(label: "Create New") {
                isPresented.toggle()
            }
            .fullScreenCover(isPresented: $isPresented) {
                CreateEntryView()
                    .presentationBackground(.ultraThinMaterial)
            }
        }
        .frame(height: 100)
    }
}
