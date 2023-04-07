//
//  ChooseSpeedRateView.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 06/04/2023.
//

import SwiftUI
import AVKit
import MediaPlayer

struct ChooseSpeedRateView: View {
    @State var rates = [0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 3]
    @Environment(\.dismiss) var dismiss
    @Binding var rateSpeed: Float
    @Binding var player: AVAudioPlayer!
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                ForEach(rates, id: \.self) { rate in
                    Button {
                        rateSpeed = Float(rate)
                        player.rate = Float(rate)
                        dismiss()
                    } label: {
                        Text("x\(rate.toString())")
                            .font(.custom("Oswald-Regular", size: 32))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                    }
                }

            }
        }
    }
}

//struct ChooseSpeedRateView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChooseSpeedRateView(rateSpeed: .constant(1.5))
//    }
//}
