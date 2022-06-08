//
//  ProjectYApp.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI
var test: UseTrip = UseTrip()

@main
struct ProjectYApp: App {
//    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                TabView {
                    
                    YourTrips().tabItem {
                        Image(systemName: "suitcase.fill")
                        Text("Suitcases")
                        
                    }
                    
                    TipsView().tabItem {
                        Image(systemName: "video.fill")
                        Text("Tips")
                        
                    }
                    
                    LeavesCollectedView().tabItem {
                        Image(systemName: "leaf.fill")
                        Text("Leaves")
                        
                    }
                }
                
//                if(needsAppOnboarding){
//                    HomeView()
//
//
//                }else{
//                    YourTrips()
//
//                }
                YourTrips()
            }.onAppear{
                test = UseTrip()
            }
            
            
            
        }
    }
}
