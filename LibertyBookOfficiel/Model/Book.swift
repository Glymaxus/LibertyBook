//
//  Book.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import Foundation

struct Book: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var author: String
//    var summary: [String]
}
