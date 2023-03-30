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
                HStack {
                    Image(book.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .frame(width: 150, height: 200)
                    
                    VStack(alignment: .leading) {
                        Text(book.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(book.author)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: ReadingBookView(book: book)) {
                            Text("Lire le résumé")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width/2, height: 30)
                                .background(Color("ColorBlueDark"))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Ecouter le résumé")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width/2, height: 30)
                                .background(Color("ColorBlueDark"))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ce que vous allez trouver dans ce LibertyBook :")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(book.description.replacingOccurrences(of: "\\n", with: "\n"))
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("ColorBlueDark"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                }
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
