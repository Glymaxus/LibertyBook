//
//  AudioViewModel.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 05/04/2023.
//

import SwiftUI
import AVKit
import MediaPlayer

struct AudioViewModel {
    
    @State var width: CGFloat = 0
    
//    func initialisingAudio(book: Book, player: AVAudioPlayer!) {
//        let url = Bundle.main.path(forResource: book.audio, ofType: "mp3")
//
//        var player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//        player!.prepareToPlay()
//
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            if player!.isPlaying {
//                let screen = UIScreen.main.bounds.width
//                let value = player!.currentTime / player!.duration
//                self.width = screen * CGFloat(value)
//            }
//        }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//          try AVAudioSession.sharedInstance().setActive(true)
//
//        } catch _ {
//            return print("Error")
//        }
//    }
    
    func setupAVAudioSession(book: Book, player: AVAudioPlayer!) {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            debugPrint("AVAudioSession is Active and Category Playback is set")
            UIApplication.shared.beginReceivingRemoteControlEvents()
            setupCommandCenter(book: book, player: player)
        } catch {
            debugPrint("Error: \(error)")
        }
    }
    
    private func setupCommandCenter(book: Book, player: AVAudioPlayer!) {
//        let artworkImage = UIImage(named: book.image)
//        let artwork = MPMediaItemArtwork(boundsSize: artworkImage!.size) { size in
//            return artworkImage!
//        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: book.name, MPMediaItemPropertyArtist: book.author,  MPNowPlayingInfoPropertyElapsedPlaybackTime: player.currentTime,
                                                MPMediaItemPropertyPlaybackDuration: player.duration]
   // MPMediaItemPropertyArtwork: artwork,
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            player.play()
            return .success
        }
        
        commandCenter.pauseCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            player.pause()
            return .success
        }
        
        commandCenter.skipForwardCommand.addTarget { (envent) -> MPRemoteCommandHandlerStatus in
            let increase = player.currentTime + 10
            
            if increase < player.duration {
                player.currentTime = increase
            }
            return .success
        }
        
        commandCenter.skipBackwardCommand.addTarget { (envent) -> MPRemoteCommandHandlerStatus in
            let decrease = player.currentTime - 10
            
            if decrease < player.duration {
                player.currentTime = decrease
            }
            return .success
        }
    }
}
