//
//  FavoritesBookView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 10/04/2023.
//

import SwiftUI

struct FavoritesBookView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: UserProfileView()) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        .padding(.trailing)
                    }
                    
                    VStack {
                        Text("Mes Favoris")
                            .font(.custom("Oswald-Bold", size: 32))
                            .foregroundColor(.white)
                        
                        ForEach(0 ... 5, id: \.self) { book in
                            FavoritesBookCellView()
                        }
                    }
                }
            }
        }
    }
}

struct FavoritesBookView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesBookView()
    }
}
