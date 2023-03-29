//
//  ActionButtonModifiersView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 28/03/2023.
//

import SwiftUI

struct ActionButtonModifiersView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
            .background(Color("ColorBlueLight"))
            .clipShape(Capsule())
            .padding()
    }
}
