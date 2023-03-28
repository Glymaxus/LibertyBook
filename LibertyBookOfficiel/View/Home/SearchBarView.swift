//
//  SearchBarView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 24/03/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Chercher un livre...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.white))
                .foregroundColor(.black)
                .cornerRadius(24)
                .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                )
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant("Test"))
            .previewLayout(.sizeThatFits)
    }
}
