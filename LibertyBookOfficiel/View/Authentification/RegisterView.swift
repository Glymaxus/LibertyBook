//
//  RegistrationView.swift
//  LibertyBook
//
//  Created by bastien giat on 18/05/2021.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueWriting"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                    // MARK: - LOGO
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                    
//                        Text("Bienvenue sur LibertyBook")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .padding(.top, -60)
                
                // MARK: - TEXTFIELDS
                VStack {
                    CustomTextFieldView(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextFieldView(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomSecureFieldView(text: $password, placeholder: Text("Mot de passe"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.register(withEmail: email, password: password, username: username)
                }, label: {
                    Text("Créer un compte")
                        .modifier(ActionButtonModifiersView())
                })
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Vous avez déjà un compte ?")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Text("Se connecter")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                })
            }//: VSTACK
            .navigationBarHidden(true)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
