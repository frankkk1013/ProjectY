//
//  HomeView.swift
//  ProjectY
//
//  Created by Emanuele Bosco on 23/05/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var date = Date()

    
    var body: some View {
        NavigationView {
                        VStack{
                            Text("")
                            
//                            Text(searchText)
                            .searchable(text: $searchText, prompt: "Where do you want to go?")
                            
                            DatePicker(
                                    "Start Date",
                                    selection: $date,
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.graphical)
                                Spacer()
                               }
                            .navigationTitle("New trip")
            
           
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
