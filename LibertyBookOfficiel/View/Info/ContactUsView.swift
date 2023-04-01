//
//  ContactUsView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 31/03/2023.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 12) {
              Text("Si vous voulez nous faire part d'un bug, d'un problème, d'une suggestion ou si tout simplement vous avez une question, veuillez nous contactez sur cette addresse mail : ")
                    .font(.custom("Oswald-Regular", size: 20))
                    .foregroundColor(.white)
                
                Text("libertybookofficiel@gmail.com")
                    .font(.custom("Oswald-Bold", size: 20))
                
                Text("Nous vous recontacterons dans les plus brefs delais.\nCordialement, l'équipe LibertyBook.")
                    .font(.custom("Oswald-Regular", size: 20))
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
