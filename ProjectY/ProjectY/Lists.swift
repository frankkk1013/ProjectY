//
//  Lists.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 30/05/22.
//

import SwiftUI

struct Lists: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var tripToShow = Trip(city: "", lists: [], tripDetails: TripDetails(pref: []))
    @StateObject var trips: UseTrip
    @State var trip : Trip
    
   
    
    
    
    
    var title: String
    var body: some View {
        
        List {
//            ForEach(trips.listOfTrips[trips.listOfTrips.firstIndex(where: { $0.city == trip.city })!].lists.first(where: {$0.name == title})!) { item in
//
//                ListRowView(item: item)
//                    .onTapGesture {
//                        withAnimation(.linear) {
//                            listViewModel.updateItem(item: item)
//                        }
//                    }
//            }
        }        .listStyle(DefaultListStyle())
        //        .listStyle(Plain/Grouped/Sidebar/Default/InsetGroupedListStyle())
        .navigationTitle(title)
//        .onAppear{
//            trips.listOfTrips[trips.listOfTrips.firstIndex(where: { $0 == trip })!].lists.first(where: {$0.name == title})
//        }
        
    }
}



//struct Lists_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Lists(title: "")
//        }
//        .environmentObject(ListViewModel())
//    }
//}
