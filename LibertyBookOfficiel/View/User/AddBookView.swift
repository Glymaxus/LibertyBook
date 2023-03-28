//
//  AddBookView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 27/03/2023.
//

import SwiftUI

struct AddBookView: View {
    @State var bookName = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                TextField("Nom du livre", text: $bookName)
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
