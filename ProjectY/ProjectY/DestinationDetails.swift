//
//  DestinationDetails.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct DestinationDetails: View {
    @StateObject var trips: UseTrip
    @State var trip : Trip
    @State var destinationList: ToDoList = ToDoList(name: "", rows: [], completePercent: "")
    @State var showList: Bool = false
    
    var body: some View {
        
        List {
            Section(header: Text("Checklists")
                .font(.title3)
                .fontWeight(.bold)) {
                    ForEach(trip.lists){ list in
                        CardListView(systemName: "list.bullet", name: list.name, counter: "") //to count rows where a certain condition is satisified
                            .onTapGesture {
                                print("hello")
                                destinationList = list
                                showList.toggle()
                            }
                        
                    }
//            NavigationLink(destination: Lists(), label: {
//                CardListView(systemName: "tshirt.fill", name: "Clothes", counter: "9")
//            })
////            .listRowSeparator(.hidden)
//            
//            NavigationLink(destination: Lists(), label: {
//                CardListView(systemName: "comb.fill", name: "Toiletries", counter: "12")
//            })
//            
//            NavigationLink(destination: Lists(), label: {
//                CardListView(systemName: "beats.headphones", name: "Technology", counter: "11")
//            })
//            
//            NavigationLink(destination: Lists(), label: {
//                CardListView(systemName: "camera.fill", name: "Photography", counter: "8")
//            })
        }
        }
        .background{
            NavigationLink("", isActive: $showList, destination: {Lists(trips: trips, trip: trip, title: destinationList.name).environmentObject(ListViewModel())})
        }
//        .listStyle(InsetListStyle())
        .listStyle(.insetGrouped)
        .navigationTitle(trip.city)
        
//        .toolbar {
//            ToolbarItem(placement: .primaryAction) {
//                Menu {
//                    Button(action: {}) {
//                        Label("Location and Date", systemImage: "calendar")
//                    }
//
//                    Button(action: {}) {
//                        Label("Transportation", systemImage: "airplane")
//                    }
//
//                    Button(action: {}) {
//                        Label("Accomodation", systemImage: "house.fill")
//                    }
//
//                    Button(action: {}) {
//                        Label("Luggage", systemImage: "suitcase.fill")
//                    }
//
//                    Button(action: {}) {
//                        Label("Activities", systemImage: "sun.max.fill")
//                    }
//                }
//            label: {
//                Label("", systemImage: "info.circle")
//            }
//
//            }
//        }
    }
}


//struct DestinationDetails_Previews: PreviewProvider {
//    static var previews: some View {
////        DestinationDetails()
//    }
//}
