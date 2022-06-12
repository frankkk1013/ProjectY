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
    @StateObject var lists: UseList = UseList()
    @State var trip : Trip
    @State var list : ToDoList = ToDoList(name: "", rows: [], completePercent: "")
    
   
    
    
    
    
    var title: String
    var body: some View {
        
        List {
            
            
            ForEach(listViewModel.items) { item in

                ListRowView(item: item)
                    .onTapGesture {
                       
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                            print(item.isCompleted)
                            
//                            if item.checked == "true"{
//                                list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
//                                 = "false"
//
//
//                            }else{
//                                list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
//                                 = "false"
//
//                            }
                            
//                            trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
////                                .rows[trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows.firstIndex(where: {$0.title == item.title})!].
//                            trips.handleUpdate(newValueTrip: trip)
                    
                                                                                                                        
                        }
                    }
            }
            
            
            
            
            
            
//            ForEach(list.rows) { item in
//
//                ListRowView(item: item)
//                    .onTapGesture {
//                        print("what")
//                        withAnimation(.linear) {
//
//                            if item.checked == "true"{
//                                list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
//                                 = "false"
//
//
//                            }else{
//                                list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
//                                 = "false"
//
//                            }
//
////                            trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
//////                                .rows[trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows.firstIndex(where: {$0.title == item.title})!].
////                            trips.handleUpdate(newValueTrip: trip)
//
//
//                        }
//                    }
//            }
        }        .listStyle(DefaultListStyle())
      
        .navigationTitle(title)

        .onAppear{
            list = trips.listOfTrips[trips.listOfTrips.firstIndex(where: { $0.city == trip.city })!].lists.first(where: {$0.name == title})!
            listViewModel.setItems(rows: list.rows)
        }
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
