//
//  ReadingBookView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 29/03/2023.
//

import SwiftUI

struct ReadingBookView: View {
    var book: Book
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                .padding(.leading)
                ScrollView(showsIndicators: true) {
                    VStack() {
                        

                        ForEach(Array(book.chapters.enumerated()), id: \.0) { index, chapter in
                            Text("Chapitre \(index + 1)")
                                .font(.custom("Oswald-Bold", size: 38))
                                .foregroundColor(Color("ColorBlueWriting"))
                                .padding(.bottom)
                            
                            Text(chapter.replacingOccurrences(of: "\\n", with: "\n"))
                                .font(.custom("Oswald-Regular", size: 20))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ReadingBookView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingBookView(book: bookData[0])
    }
}
