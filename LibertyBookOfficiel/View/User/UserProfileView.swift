//
//  UserProfileView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 24/03/2023.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                List {
                    Section(header: Text("Mon compte").font(.custom("Oswald-SemiBold", size: 26)).foregroundColor(.white)) {
                        UserPageLineView(lineTitle: "Pseudo", imageName: "person", userInfo: authViewModel.currentUser?.username ?? "")
                        
                        UserPageLineView(lineTitle: "Adresse mail", imageName: "envelope", userInfo: authViewModel.currentUser?.email ?? "")
                        
                        NavigationLink(destination: AddBookView()) {
                            UserPageLineView(lineTitle: "Gérer mon abonnement", imageName: "creditcard")
                        }
                        
                        if authViewModel.currentUser?.accountType == .admin {
                            NavigationLink(destination: AddBookView()) {
                                UserPageLineView(lineTitle: "Ajouter un livre à la base de données", imageName: "book")
                            }
                        }
                    }
                    .headerProminence(.increased)
                    
                    
                    
                    Section(header: Text("A propos").font(.custom("Oswald-SemiBold", size: 26)).foregroundColor(.white))  {
                        NavigationLink(destination: ContactUsView()) {
                            UserPageLineView(lineTitle: "Nous contacter", imageName: "message")
                        }
                        
                        NavigationLink(destination: ConditionsGeneralesView()) {
                            UserPageLineView(lineTitle: "Conditions Générales", imageName: "scroll")
                        }
                        
                        NavigationLink(destination: PolitiqueConfidentialiteView()) {
                            UserPageLineView(lineTitle: "Politique de confidentialité", imageName: "scroll")
                        }
                    }
                    .headerProminence(.increased)
                }
                .scrollContentBackground(.hidden)
                .listRowBackground(Color.white)
                
                Button {
                    authViewModel.signOut()
                } label: {
                    Text("Se déconnecter")
                        .font(.custom("Oswald-SemiBold", size: 18))
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .environmentObject(AuthViewModel())
    }
}

