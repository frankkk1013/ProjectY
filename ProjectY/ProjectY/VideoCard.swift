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
        
        ZStack {
            ZStack(alignment: .bottomLeading) {
                
                
                Image("cover")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 250)
                    .cornerRadius(15)
                
            }
            
            //                AsyncImage(url: URL(string: "")) { image in
            //                    image.resizable()
            //                        .aspectRatio(contentMode: .fill)
            //                        .frame(width: 160, height: 250)
            //                        .cornerRadius(10)
            //                } placeholder: {
            //                    Rectangle()
            //                        .foregroundColor(.gray.opacity(0.3))
            //                        .frame(width: 160, height: 250)
            //                        .cornerRadius(10)
            //                }
            
            //                VStack(alignment: .leading) {
            //                    Text("sec")
            //                        .font(.caption).bold()
            //
            //                    Text("By")
            //                        .font(.caption).bold()
            //                        .multilineTextAlignment(.leading)
            //                }
            //                .foregroundColor(.white)
            //                .shadow(radius: 20)
            //                .padding()
            
            
//            Image(systemName: "play.fill")
//                .foregroundColor(.white)
//                .font(.title)
//                .padding()
//                .background(.ultraThinMaterial)
//                .cornerRadius(50)
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard()
    }
}
