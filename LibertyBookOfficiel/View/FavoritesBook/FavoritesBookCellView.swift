//
//  FavoritesBookCellView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 10/04/2023.
//

import SwiftUI

struct FavoritesBookCellView: View {
//    let book: Book
    @State private var isLiked = false
    var body: some View {
        HStack(spacing: 5) {
            Image("pereRichePerePauvre")
                .resizable()
                .scaledToFill()
                .cornerRadius(12)
                .frame(width: 90, height: 160)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Père riche père pauvre")
                        .font(.custom("Oswald-SemiBold", size: 18))
                        .foregroundColor(Color("ColorBlueWriting"))
                    
                    Spacer()
                    
                    Button {
                        isLiked.toggle()
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .padding()
                            .foregroundColor(.red)
                    }
                }
                
                Text("Robert Kyiosaki")
                    .font(.custom("Oswald-Regular", size: 18))
                    .foregroundColor(Color("ColorBlueWriting"))
                    .padding(.bottom, 5)
                
                Text("ceci est la descritpion du livr et c'est super parce que je peux la faire longue y'a aucun souci ça baise pas le design")
                    .font(.custom("Oswald-Light", size: 18))
                    .foregroundColor(Color("ColorBlueWriting"))
                    .lineLimit(3)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 175)
        .background(.white)
        .cornerRadius(18)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .padding(.bottom)
    }
}

struct FavoritesBookCellView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesBookCellView()
            .previewLayout(.sizeThatFits)
    }
}
