//
//  LeavesCollectedView.swift
//  ProjectY
//
//  Created by Emanuele Bosco on 29/05/22.
//

import SwiftUI

struct LeavesCollectedView: View {
    @State var next: Bool = false
    @State private var progressValue: Float = 0.0

    var body: some View {
//        NavigationView{
            VStack{
                
                MyProgressBar(progressValue: $progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(30.0)

                
                
//                    Circle().fill(
////                        Color.primary
//                        Color(#colorLiteral(red: 0.8752234578, green: 0.9352452159, blue: 0.8954163194, alpha: 1))
//                    )
//
//                        .frame(width: 310, height:310) .overlay(Image("tree").resizable()
//                        .frame(width: 200, height: 200)
//                        .aspectRatio(contentMode: .fill))
//
//
//
////                    Image("tree")
////                        .resizable()
////                        .frame(width: 200, height: 200)
////                        .aspectRatio(contentMode: .fill)
//
//
//
//                        .overlay(Circle().stroke(Color.white, lineWidth: 42))     //bordo bianco storia
//
//                        .overlay(Circle().stroke(Color(#colorLiteral(red: 0.1677696109, green: 0.684253037, blue: 0.3964454532, alpha: 1)), lineWidth: 10))
//
//                        .padding(.all)
//                        .padding(.all)
//                        .padding(.all)


                    .padding()
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                
                
                Text("Leaves you collected so far:")
                    .font(.body)
                    .fontWeight(.semibold)

                    .padding(.all)

                
                
                HStack{
                    
                    Image(systemName: "leaf.fill").foregroundColor(Color(#colorLiteral(red: 0.1677696109, green: 0.684253037, blue: 0.3964454532, alpha: 1)))
                    
                    Text("82")
                        .padding(.leading)
                    
                }.navigationTitle("Sustainability status")
                
                 
                
                    
//                    Button {
//                        print("Button was tapped")
//
//                        next.toggle()
//
//                    } label: {
//                        Text("View Leaves Chronology                 ")
//                            .font(.title3).bold()
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color( "GreenSquare")).cornerRadius(12)
//
//                    }.frame(width: 300, height: 50)
//                        .padding(.top)
//                        .navigationTitle("Your sustainability status")
//
//
//                        .background{
//                            NavigationLink("", isActive: $next, destination: { LeavesChronology()})
//                        }
        }
    }
}

struct LeavesCollectedView_Previews: PreviewProvider {
    static var previews: some View {
        LeavesCollectedView()
    }
}
