//
//  ProjectYApp.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI
var trips: UseTrip = UseTrip()


@main
struct ProjectYApp: App {
//    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
   
    var body: some Scene {
        WindowGroup {
                TabView {
                    
                    YourTrips(trips: trips).tabItem {
                        Image(systemName: "suitcase.fill")
                        Text("Trips")
                        
                    }
                    
                    Tips().tabItem {
                        Image(systemName: "video.fill")
                        Text("Tips")
                        
                    }
                    
                    LeavesCollectedView().tabItem {
                        Image(systemName: "leaf.fill")
                        Text("Leaves")
                        
                    }
                }.accentColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
//                if(needsAppOnboarding){
//                    HomeView()
//
//                }else{
//                    YourTrips()
//
//                }
        }
    }
}

