//
//  LoginView.swift
//  LibertyBook
//
//  Created by bastien giat on 14/04/2021.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
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
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: ResetPasswordView(email: $email),
                            label: {
                                Text("Forgot password ?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                                    .padding(.trailing, 28)
                            })
                    }
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Se connecter")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color("ColorBlueLight"))
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView(),
                        label: {
                            HStack {
                                Text("Vous n'avez pas de compte ?")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Text("Créer un compte")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                                
                            }
                        })
                }//: VSTACK
                .navigationBarHidden(true)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
