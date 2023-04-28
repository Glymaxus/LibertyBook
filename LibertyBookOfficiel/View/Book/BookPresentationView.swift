//
//  BookPresentationView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI
import Kingfisher

struct BookPresentationView: View {
    var book: Book
    @State var isLiked = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var bookViewModel: BookViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                HStack {
                    KFImage(URL(string: book.image))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .frame(width: 150, height: 200)
                    
                    VStack(alignment: .leading) {
                        Text(book.name)
                            .font(.custom("Oswald-Medium", size: 28))
                            .foregroundColor(.white)
                        
                        Text(book.author)
                            .font(.custom("Oswald-Light", size: 24))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: ReadingBookView(book: book)) {
                            HStack {
                                Text("Lire le résumé")
                                
                                Image(systemName: "arrow.right")
                            }
                            .font(.custom("Oswald-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width/2, height: 30)
                            .background(Color("ColorBlueDark"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        NavigationLink(destination: AudioBookView(book: book)) {
                            HStack {
                                Text("Ecouter le résumé")
                                
                                Image(systemName: "arrow.right")
                            }
                            .font(.custom("Oswald-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width/2, height: 30)
                            .background(Color("ColorBlueDark"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ce que vous allez trouver dans ce LibertyBook :")
                        .font(.custom("Oswald-Medium", size: 20))
                        .foregroundColor(.white)
                    
                    Text(book.description.replacingOccurrences(of: "\\n", with: "\n"))
                        .font(.custom("Oswald-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("ColorBlueDark"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                
                VStack {
                    Text("Afin d'entrer plus précisement dans les détails du livre, nous vous conseillerons toujours d'acheter le livre :")
                        .font(.custom("Oswald-Medium", size: 20))
                        .foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "cart")
                        Link("Acheter le livre ->", destination: URL(string: "\(book.buyLink)")!)
                            .font(.custom("Oswald-Regular", size: 18))
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("ColorBlueLight"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.bottom, 40)
            }
            .padding(8)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if bookViewModel.favoritesBooks != [] {
                        for book in bookViewModel.favoritesBooks {
                            if self.book == book  {
                                bookViewModel.removeFromFavorites(userId: authViewModel.currentUser?.id ?? "", book: self.book, completion: { success in
                                    
                                    if success {
                                        isLiked = false
                                    }
                                })
                                
                            } else {
                                bookViewModel.addToFavorites(userId: authViewModel.currentUser?.id ?? "", book: self.book, completion: { success in
                                    if success {
                                        isLiked = true
                                    }
                                })
                            }
                        }
                    } else {
                        bookViewModel.addToFavorites(userId: authViewModel.currentUser?.id ?? "", book: self.book, completion: { success in
                            if success {
                                isLiked = true
                            }
                        })
                    }
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BookPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        BookPresentationView(book: bookData[0])
    }
}
