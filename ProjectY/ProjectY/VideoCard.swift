//
//  VideoCard.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 10/06/22.
//

import SwiftUI
import AVKit

struct VideoCard: View {
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard()
    }
}
