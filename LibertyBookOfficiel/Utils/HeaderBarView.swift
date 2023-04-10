//
//  HeaderBarView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 10/04/2023.
//

import SwiftUI

struct HeaderBarView: View {
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink(destination: UserProfileView()) {
                Image(systemName: "gearshape")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            .padding(.top)
            .padding(.trailing)
        }
    }
}

struct HeaderBarView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderBarView()
    }
}
