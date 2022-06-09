//
//  ProjectYApp.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI


@main
struct ProjectYApp: App {
//    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var test: UseTrip = UseTrip()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    
                    YourTrips().tabItem {
                        Image(systemName: "suitcase.fill")
                        Text("Trips")
                    }
                    
                    TipsView().tabItem {
                        Image(systemName: "video.fill")
                        Text("Tips")
                    }
                    
                    LeavesCollectedView().tabItem {
                        Image(systemName: "leaf.fill")
                        Text("Leaves")
                    }
                    
                }.accentColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                
            }.environmentObject(listViewModel)
            
//                if(needsAppOnboarding){
//                    HomeView()
//                }else{
//                    YourTrips()
//                }
            
        }
    }
}

