//
//  User.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 23/03/2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var email: String
    var username: String
    var accountType: AccountType
    
    
    var isCurrentUser: Bool { return AuthViewModel().userSession?.uid == id }
}

enum AccountType: Int, Codable {
    case admin
    case normalUser
}
