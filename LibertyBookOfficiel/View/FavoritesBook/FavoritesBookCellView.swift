//
//  FavoritesBookCellView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 10/04/2023.
//

import SwiftUI
import Kingfisher

struct FavoritesBookCellView: View {
    let book: Book
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var bookViewModel: BookViewModel
    @State private var isLiked = true
    var body: some View {
        HStack(spacing: 5) {
            KFImage(URL(string: book.image))
                .resizable()
                .scaledToFill()
                .cornerRadius(12)
                .frame(width: 90, height: 160)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text(book.name)
                        .font(.custom("Oswald-SemiBold", size: 18))
                        .foregroundColor(Color("ColorBlueWriting"))
                    
                    Spacer()
                    
                    Button {
                        bookViewModel.removeFromFavorites(userId: authViewModel.currentUser?.id ?? "", book: self.book, completion: { success in
                            if success {
                                bookViewModel.fetchFavorites()
                            }
                        })
                        
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .padding()
                            .foregroundColor(.red)
                    }
                }
                
                Text(book.author)
                    .font(.custom("Oswald-Regular", size: 18))
                    .foregroundColor(Color("ColorBlueWriting"))
                    .padding(.bottom, 5)
                
                Text(book.description)
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
        FavoritesBookCellView(book: bookData[0])
            .previewLayout(.sizeThatFits)
    }
}
