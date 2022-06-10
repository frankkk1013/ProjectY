//
//  Tips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 06/06/22.
//

import SwiftUI
import AVKit
import AVFoundation

struct Tips: View {
    
    var video = [
        AVPlayer(url: Bundle.main.url(forResource: "Vid1", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "Vid2", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "Vid3", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "Vid4", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "Vid5", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "Vid6", withExtension: "mp4")!),
        AVPlayer(url: Bundle.main.url(forResource: "Vid7", withExtension: "mp4")!)
    ]
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing:0) {
                        ForEach (video, id: \.self) { item in
                            NavigationLink {
                                VideoView(videoPlayer: item)
                            } label: {
                                VideoCard()
                            }
                            .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarHidden(true)
        }
        
        //        VStack{
        //
        //            Text("Tips View Here")
        //
        //        }
    }
}

struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        Tips()
    }
}
