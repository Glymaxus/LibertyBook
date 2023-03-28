//
//  BookPresentationView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI

struct BookPresentationView: View {
    var book: Book
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center) {
                    Image(book.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .frame(width: 250, height: 400)
                    
                    Text(book.name)
                        .font(.title)
                        .fontWeight(.black)
                    
                    Text(book.author)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Lire le résumé")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(Color("ColorBlueDark"))
                                )
                        }
                        .padding(.horizontal, 8)
                        
                        Button {
                            
                        } label: {
                            Text("Ecouter l'audio")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(Color("ColorBlueDark"))
                                )
                        }
                        .padding(.horizontal, 8)


                    }
                }
                .navigationTitle(book.name)
                .navigationBarTitleDisplayMode(.inline)
            .padding()
            }
        }
    }
}

struct BookPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        BookPresentationView(book: bookData[0])
    }
}
