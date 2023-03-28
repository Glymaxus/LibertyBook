//
//  UserPageLineView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 24/03/2023.
//

import SwiftUI

struct UserPageLineView: View {
    @State var lineTitle: String
    @State var imageName: String
    @State var userInfo: String?
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(lineTitle)
            
            Spacer()
            
            if userInfo != "" {
                Text(userInfo ?? "")
                    .foregroundColor(.gray)
            }
            
        }
    }
}

struct UserPageLineView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageLineView(lineTitle: "Pseudo", imageName: "person", userInfo: "Laura")
    }
}
