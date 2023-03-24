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
        VStack(alignment: .leading) {
            
            Section {
                    Text(authViewModel.currentUser?.username ?? "")
                    
                    Text(authViewModel.currentUser?.email ?? "")
            }
            
            Button {
                authViewModel.signOut()
            } label: {
                Text("Se déconnecter")
                    .foregroundColor(.red)
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

