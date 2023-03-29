//
//  ResetPasswordView.swift
//  InstagramClone
//
//  Created by bastien giat on 06/05/2021.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Binding private var email: String
    
    @Environment(\.presentationMode) var presentationMode
    
    init(email: Binding<String>) {
        self._email = email
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueWriting"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image("instagram_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack(spacing: 20) {
                    CustomTextFieldView(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("Send reset password link")
                        .modifier(ActionButtonModifiersView())
                })
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Already have an account ?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                })
            }
            .padding(.top, -44)
        }
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}
