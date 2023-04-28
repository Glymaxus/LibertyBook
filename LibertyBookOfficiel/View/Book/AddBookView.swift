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
    @State var description = ""
    @State var chapters: [String] = [""]
    @State var buyLink = ""
    @State var sound = ""
    @State var missingAText = false
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    @EnvironmentObject var bookViewModel: BookViewModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    Text("Entrer les informations du livre pour le transférer dans la base de données")
                        .font(.custom("Oswald-Bold", size: 22))
                        .foregroundColor(.white)
                    
                    Button {
                        isPickerShowing = true
                    } label: {
                        if selectedImage != nil {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(width: 200, height: 200)
                        } else {
                            Text("Choisir une photo")
                                .font(.custom("Oswald-Regular", size: 24))
                                .foregroundColor(.white)
                        }
                    }

                    HStack {
                        TextField("Nom", text: $bookName)
                        
                        TextField("Auteur", text: $author)
                    }
                    
                    TextField("Description", text: $description)
                    
                    TextField("Audio", text: $sound)
                    
                    TextField("Lien d'achat", text: $buyLink)
                    
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
                        if bookName != "" && author != "" && selectedImage != nil  && description != "" && sound != "" && chapters != [""] {
                            bookViewModel.createBook(name: bookName, author: author, image: selectedImage!, description: description, chapters: chapters, buyLink: buyLink, sound: sound)
                            bookName = ""
                            author = ""
                            selectedImage = nil
                            description = ""
                            sound = ""
                            buyLink = ""
                            chapters = [""]
                        } else {
                            missingAText = true
                        }
                    } label: {
                        Text("Valider le livre")
                            .modifier(ActionButtonModifiersView())
                    }
                    .padding(.bottom, 60)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .sheet(isPresented: $isPickerShowing, content: {
                    // image picker
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                })
                .alert("Veuillez rentrer tous les champs du livre", isPresented: $missingAText) {
                    Button("Ok", role: .cancel) {
                        missingAText = false
                    }
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
