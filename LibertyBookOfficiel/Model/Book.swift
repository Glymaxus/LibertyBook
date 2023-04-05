//
//  Book.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import FirebaseFirestoreSwift

struct Book: Identifiable, Codable {
    @DocumentID var id: String?
    var image: String
    var name: String
    var author: String
    var description: String
    var chapters: [String]
    var audio: String
    var buyLink: String
//    var summary: [String]
}
