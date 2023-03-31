//
//  AddBookView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 27/03/2023.
//

import SwiftUI

struct AddBookView: View {
    @State var bookName = ""
    @State var author = ""
    @State var image = ""
    @State var description = ""
    @State var chapters: [String] = [""]
    @State var missingAText = false
    
    @EnvironmentObject var bookViewModel: BookViewModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 16) {
                Text("Entrer les informations du livre pour le transférer dans la base de données")
                    .font(.custom("Oswald-Bold", size: 22))
                    .foregroundColor(.white)
                
                HStack {
                    TextField("Nom", text: $bookName)
                    
                    TextField("Auteur", text: $author)
                }
                
                TextField("Image", text: $image)
                
                TextField("Description", text: $description)
                
                VStack {
                    ForEach(chapters.indices, id: \.self) { index in
                        TextField("Chapitre \(index + 1)", text: $chapters[index])
                    }
                    Button {
                        chapters.append("")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .padding(.top)

                }
                
                Button {
                    if bookName != "" && author != "" && image != ""  && description != "" {
                        bookViewModel.createBook(name: bookName, author: author, image: image, description: description, chapters: chapters)
                        bookName = ""
                        author = ""
                        image = ""
                        description = ""
                        chapters = [""]
                    } else {
                        missingAText = true
                    }
                } label: {
                    Text("Valider le livre")
                        .modifier(ActionButtonModifiersView())
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .alert("Veuillez rentrer tous les champs du livre", isPresented: $missingAText) {
                Button("Ok", role: .cancel) {
                    missingAText = false
                }
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
