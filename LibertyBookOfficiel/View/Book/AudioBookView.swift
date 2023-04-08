//
//  AudioBookView.swift
//  LibertyBook
//
//  Created by bastien giat on 20/05/2021.
//

import SwiftUI
import AVKit
import MediaPlayer
import Kingfisher

struct AudioBookView: View {
    let book: Book
    let audioViewModel = AudioViewModel()
    @State var time: CGFloat = 0
    @State var player: AVAudioPlayer!
    @State var width: CGFloat = 0
    @State var playing = false
    @State private var currentTime = "0:00"
    @State private var duration = ""
    @State private var speedRate: Float = 1.0
    @State private var showSpeedRateSheet = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                KFImage(URL(string: book.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300, alignment: .center)
                    .cornerRadius(12)
                    .padding(.bottom, 50)
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.white)
                        .frame(height: 8)
                        .padding(10)
                    
                    Capsule()
                        .fill(Color("ColorBlueWriting"))
                        .frame(width: self.width, height: 8)
                        .padding(10)
                }
                
                HStack {
                    Text("\(self.currentTime)")
                        .font(.custom("Oswald-Regular", size: 24))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(duration)
                        .font(.custom("Oswald-Regular", size: 24))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                HStack(spacing: 48) {
                    Button(action: {
                        self.player.currentTime -= 15
                    }, label: {
                        Image(systemName: "gobackward.15")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                    })
                    
                    Button(action: {
                        
                        if player.isPlaying {
                            self.player.pause()
                            self.playing = false
                        } else {
                            self.player.play()
                            self.playing = true
                        }
                    }, label: {
                        Image(systemName: self.playing ? "pause" : "play")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                    })
                    
                    Button(action: {
                        let increase = self.player.currentTime + 15
                        
                        if increase < self.player.duration {
                            self.player.currentTime = increase
                        }
                    }, label: {
                        Image(systemName: "goforward.15")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                    })
                    
                }
                
                Button {
                        showSpeedRateSheet = true
                } label: {
                    Text("Vitesse : x\(Double(speedRate).toString())")
                        .font(.custom("Oswald-Regular", size: 24))
                        .foregroundColor(.white)
                }
                .padding()
                .buttonStyle(.bordered)
                .tint(Color("ColorBlueLight"))
            }
            .onAppear {
                
                let url = Bundle.main.path(forResource: self.book.audio, ofType: "mp3")
                
                self.player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
                player.enableRate = true
                self.player.prepareToPlay()
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if self.player.isPlaying {
                        let screen = UIScreen.main.bounds.width
                        let value = self.player.currentTime / self.player.duration
                        self.width = screen * CGFloat(value)
                    }
                    
                    let currentTime = self.player.currentTime
                    let currentTimeMinutes = Int(currentTime / 60)
                    let currentTimeSeconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
                    let formattedCurrentTime = String(format: "%d:%02d", currentTimeMinutes, currentTimeSeconds)
                    self.currentTime = formattedCurrentTime
                }
                
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                } catch _ {
                    return print("Error")
                }
                audioViewModel.setupAVAudioSession(book: book, player: player)

                let duration = self.player.duration
                let durationMinutes = Int(duration / 60)
                let durationSeconds = Int(duration.truncatingRemainder(dividingBy: 60))
                let formattedDuration = String(format: "%d:%02d", durationMinutes, durationSeconds)
                self.duration = formattedDuration
                
            }
            .onDisappear {
                self.player.stop()
            }
        }
        .sheet(isPresented: $showSpeedRateSheet) {
            ChooseSpeedRateView(rateSpeed: $speedRate, player: $player)
        }
    }
}





struct AudioBookView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookView(book: bookData[0])
    }
}
