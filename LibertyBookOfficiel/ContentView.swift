//
//  ContentView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedTab: Tabs = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
        } else {
//            if let user = viewModel.currentUser {
            ZStack {
                VStack {
                    TabView(selection: $selectedTab) {
                        if selectedTab == .house {
                            HomeView()
                        } else if selectedTab == .book {
                            FavoritesBookView()
                        }
                    }
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
