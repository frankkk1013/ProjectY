//
//  HomeView.swift
//  ProjectY
//
//  Created by Emanuele Bosco on 23/05/22.
//

import SwiftUI

struct OldHomeView: View {
    @State private var searchText = "Where do you want to go?"
    @State private var date = Date()
    @State var next: Bool = false
    @StateObject private var viewModel = ContentViewModel()
    @FocusState private var nameIsFocused: Bool
    
    @State var dateRange: ClosedRange<Date>? = nil
    
    @State var showResults: Bool = false
    
    
    var body: some View {
        
        VStack{
            //                            Text("")
            //
            //                                .searchable(text: $viewModel.cityText, prompt: searchText)
            //                            TextField(searchText, text: $viewModel.cityText)
            HStack{
                TextField(searchText, text: $viewModel.cityText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.showResults = true
                    }.focused($nameIsFocused)
                
                if showResults {
                    Button(action: {
                        self.showResults = false
                        self.nameIsFocused = false
                        
                       
                        
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }.padding()
            
            
            
            
            
            if showResults{
                
                List(viewModel.viewData) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                        Text(item.subtitle)
                            .foregroundColor(.secondary)
                    }.onTapGesture {
                        viewModel.cityText = item.title
                        self.searchText = item.title
                        self.showResults.toggle()
                    }
                }.navigationTitle("Results").padding()
                
            }else{
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
                Spacer()
                
                
                    .navigationTitle("New Trip")
                
                
//                    .background{
//                        NavigationLink("", isActive: $next, destination: { Trasportation()})
//                    }
                
            }
            
            
        }
        //                        .onChange(of: viewModel.cityText){ newValue in
        //                            self.showResults = true
        //
        //                        }
        
    }
}


struct OldHomeView_Previews: PreviewProvider {
    static var previews: some View {
        OldHomeView()
    }
}
