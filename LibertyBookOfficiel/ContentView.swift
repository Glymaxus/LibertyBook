//
//  ContentView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
        } else {
//            if let user = viewModel.currentUser {
                HomeView()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
