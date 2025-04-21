//
//  Entry.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import Foundation
import SwiftData

@Model
class Entry: Identifiable {
    var date: Date
    var title: String
    var content: String
    var background: Background
    var newsHeadline: String
    var newsImage: String
    var newsSource: String
    
    init(title: String, content: String, background: Background, newsHeadline: String, newsImage: String, newsSource: String) {
        self.date = Date.now
        self.title = title
        self.content = content
        self.background = background
        self.newsHeadline = newsHeadline
        self.newsImage = newsImage
        self.newsSource = newsSource
    }
}
