//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by bastien giat on 06/05/2021.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
    }
}
