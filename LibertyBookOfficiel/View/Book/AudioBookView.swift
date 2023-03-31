//
//  AudioBookView.swift
//  LibertyBook
//
//  Created by bastien giat on 20/05/2021.
//

import SwiftUI
import AVKit

struct AudioBookView: View {
    let book: Book
    @State var time: CGFloat = 0
    @State var player: AVAudioPlayer!
    @State var width: CGFloat = 0
    @State var playing = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image(book.image)
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
                .padding(.bottom, 40)
                
                HStack {
                    Button(action: {
                        self.player.currentTime -= 15
                    }, label: {
                        Image(systemName: "gobackward.15")
                            .font(.title)
                            .foregroundColor(.white)
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
                        Image(systemName: self.playing ? "pause.circle" : "play.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    
                    Button(action: {
                        let increase = self.player.currentTime + 15
                        
                        if increase < self.player.duration {
                            self.player.currentTime = increase
                        }
                    }, label: {
                        Image(systemName: "goforward.15")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    
                }
            }
            .onAppear {
                let url = Bundle.main.path(forResource: self.book.audio, ofType: "mp3")
                
                self.player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
                self.player.prepareToPlay()
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if self.player.isPlaying {
                        let screen = UIScreen.main.bounds.width
                        let value = self.player.currentTime / self.player.duration
                        self.width = screen * CGFloat(value)
                    }
                }
            }
            .onDisappear {
                self.player.stop()
            }
        }
    }
}

struct AudioBookView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookView(book: bookData[0])
    }
}
