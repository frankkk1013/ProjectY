//
//  ProjectYApp.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

@main
struct ProjectYApp: App {
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            NavigationView{
//                if(needsAppOnboarding){
//                    HomeView()
//
//
//                }else{
//                    YourTrips()
//
//                }
                YourTrips()
            }
            
            
            
        }
    }
}
