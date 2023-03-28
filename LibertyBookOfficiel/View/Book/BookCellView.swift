//
//  BookCellView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 21/03/2023.
//

import SwiftUI

struct BookCellView: View {
    var book: Book
    var body: some View {
        VStack( spacing: 16) {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(book.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .foregroundColor(.white)
                
                Text(book.author)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
        }
    }
}

struct BookCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookCellView(book: bookData[0])
    }
}
