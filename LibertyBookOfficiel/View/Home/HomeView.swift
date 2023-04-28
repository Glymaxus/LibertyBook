//
//  HomeView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    @State private var searchText = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var bookViewModel: BookViewModel
    @State private var isNavigationBarHidden = true
    
    func MakeThegridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    HeaderBarView()
                    
                    VStack(alignment: .leading) {
                        Text("Tous les livres")
                            .font(.custom("Oswald-Bold", size: 36))
                            .foregroundColor(.white)
                        
                        SearchBarView(text: $searchText)
                            .padding(.bottom)
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(searchText.isEmpty ?  bookViewModel.books : bookViewModel.filteredBooks(searchText)) { book in
                                NavigationLink(destination: BookPresentationView(book: book)) {
                                    BookCellView(book: book)
                                        .frame(maxWidth: 150, maxHeight: 250, alignment: .center)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 50)
                        
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            MakeThegridSwitch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
