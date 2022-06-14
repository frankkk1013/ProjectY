//
//  VideoView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 10/06/22.
//

import SwiftUI
import AVFoundation
import AVKit

struct VideoView: View {
    
    @State private var player = AVPlayer()
    
    var videoPlayer: AVPlayer
    
    var body: some View {
        
        NavigationView{
            
            VideoPlayer(player: videoPlayer)
                .edgesIgnoringSafeArea(.all)
            //.frame(height: 800)
        }.onDisappear{
            videoPlayer.pause()
        }
        
        // Stop the player when the view disappears
        .onDisappear() {
            videoPlayer.pause()
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoPlayer: AVPlayer(url: Bundle.main.url(forResource: "Vid1", withExtension: "mp4")!))
    }
}
