////
////  TabView.swift
////  LibertyBookOfficiel
////
////  Created by bastien giat on 11/04/2023.
////
//
//import SwiftUI
//
//struct MainTabView: View {
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem {
//                    Image(systemName: "house.circle")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                    
//                    Text("Accueil")
//                        .font(.custom("Oswald-Regular", size: 25))
//                }
//            
//            FavoritesBookView()
//                .tabItem {
//                    Image(systemName: "book.circle")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                    
//                    Text("Mes favoris")
//                        .font(.custom("Oswald-Regular", size: 25))
//                }
//        }
//        .background(Color.white)
//        .accentColor(Color("ColorBlueDark"))
//    }
//}
//
//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
//
