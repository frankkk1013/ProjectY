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
    @State private var average: String  = "0"
    @StateObject var trips: UseTrip

    var body: some View {
        NavigationView{
            VStack{
                if Int(average)! >= 0 && Int(average)! <= 25{
                    
                    MyProgressBar(progressValue: $progressValue, image: "small")
                        .frame(width: 150.0, height: 150.0).onAppear{
                            
                        }
                        .padding(30.0)
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()

                }
                if Int(average)! > 25 && Int(average)! <= 75{
                    MyProgressBar(progressValue: $progressValue, image: "medium")
                        .frame(width: 150.0, height: 150.0)
                        .padding(30.0)
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()

                }
                if Int(average)! > 75 && Int(average)! <= 1000{
                    MyProgressBar(progressValue: $progressValue, image: "big")
                        .frame(width: 150.0, height: 150.0)
                        .padding(30.0)
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()
                        .padding()

                }
                
                
               
                
                
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


                   
                    
                
                
                Text("Sustainability Average")
                    .font(.body)
                    .fontWeight(.semibold)

                    .padding(.all)

                
                
                HStack{
                    
                    Image(systemName: "leaf.fill").foregroundColor(Color(#colorLiteral(red: 0.1677696109, green: 0.684253037, blue: 0.3964454532, alpha: 1)))
                    
                    Text(average)
                        .padding(.leading)
                    
                }.navigationTitle("Leaves")
                    .onAppear{
                        var sum = 0
                        var count = 0
                        trips.listOfTrips.forEach{ trip in
                            sum += Int(trip.sustainableLeaf)!
                            count += 1
                            
                            
                        }
                        if count == 0{
                            average = "0"
                            
                        }else{
                            average = String(sum/count)
                            
                        }
                       
                        
                    }
                
                 
                
                    
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
                        }
        }
    }
}

struct LeavesCollectedView_Previews: PreviewProvider {
    static var previews: some View {
        LeavesCollectedView(trips: trips)
    }
}
