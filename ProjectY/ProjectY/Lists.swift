//
//  Lists.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 30/05/22.
//

import SwiftUI

struct Lists: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var tripToShow = Trip(city: "", lists: [], tripDetails: TripDetails(pref: []), sustainableLeaf: "")
    @StateObject var trips: UseTrip
    @StateObject var lists: UseList = UseList()
    @State var trip : Trip
    @State var list : ToDoList = ToDoList(name: "", rows: [], completePercent: "")
    @State private var presentAlert = false
    @State private var rowTitle: String = ""
    
   
    
    
    
    
    var title: String
    var body: some View {
        
        List {
            
            
            ForEach(listViewModel.items) { item in

                ListRowView(item: item)
                    .onTapGesture {
                        if item.isCompleted{
                            list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
                             = "false"


                        }else{
                            list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
                             = "true"

                        }
                        trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
                        print(list.rows)
                        
                       
////                                .rows[trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows.firstIndex(where: {$0.title == item.title})!].
//                        trips.handleUpdate(newValueTrip: trip)
                       
                        withAnimation(.linear) {
                            
                           
                            listViewModel.updateItem(item: item)
                            
                            

                            
                            
                    
                                                                                                                        
                        }
                    }
                    
            }.onDelete(perform: delete)
            
           
            
            
            
            
            
            

        }
        
        .navigationBarItems(leading: Button(action:{
            presentAlert.toggle()
            
            
        },label: {
            Text("Add")
        }).textFieldAlert(isPresented: $presentAlert, title: "Insert your new item", text: "", placeholder: "", action: {newText in
            if !(newText?.isEmpty ?? false){
                list.rows.append(Row(category: "any", title: newText!, sustainable: "", description: "", season: "", checked: "false"))
                trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
                listViewModel.refresh(rows: list.rows)
            }
            
        }),
        trailing: EditButton()
        )
        
        .listStyle(DefaultListStyle())
      
        .navigationTitle(title)

        .onAppear{
            list = trips.listOfTrips[trips.listOfTrips.firstIndex(where: { $0.city == trip.city })!].lists.first(where: {$0.name == title})!
            listViewModel.setItems(rows: list.rows)
        }
        .onDisappear{
            updatePersistence(trip: trip)
        }
    }
    
    private func updatePersistence(trip: Trip){
        print(self.trips.handleUpdate(newValueTrip: trip))
        
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            
            self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows.remove(at: first)
            listViewModel.refresh(rows: self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows)
            
            
            
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
