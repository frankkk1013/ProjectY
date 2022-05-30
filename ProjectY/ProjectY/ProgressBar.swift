//
//  ProgressBar.swift
//  ProjectY
//
//  Created by Emanuele Bosco on 30/05/22.
//

import SwiftUI

struct MyProgressBar: View {
    @Binding var progressValue: Float
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.3)
                .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
            Circle()
                .trim(from: 0.0, to:CGFloat(min(self.progressValue,1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            
            Circle().fill(
//                        Color.primary
                Color(#colorLiteral(red: 0.8752234578, green: 0.9352452159, blue: 0.8954163194, alpha: 1))
            )
                
                .frame(width: 310, height:310) .overlay(Image("tree").resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fill))
                
            

//                    Image("tree")
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                        .aspectRatio(contentMode: .fill)
                
            
                
                .overlay(Circle().stroke(Color.white, lineWidth: 10))     //bordo bianco storia
               
                
        
                .padding(.all)
        }
    }
}
