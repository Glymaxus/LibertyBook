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
    
    func MakeThegridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Tous les livres")
                        .font(.title)
                        .fontWeight(.black)
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(bookData) { book in
                            NavigationLink(destination: BookPresentationView(book: book)) {
                                BookCellView(book: book)
                                    .frame(maxWidth: 150, maxHeight: 250, alignment: .center)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .padding()
            }
            .navigationTitle("Accueil")
            .onAppear {
                MakeThegridSwitch()
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
