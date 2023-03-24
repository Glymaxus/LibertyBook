//
//  LibertyBookOfficielApp.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI
import Firebase

@main
struct LibertyBookOfficielApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
                .environmentObject(BookViewModel())
        }
    }
}
