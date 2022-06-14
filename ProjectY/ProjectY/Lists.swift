//
//  Lists.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 30/05/22.
//

import SwiftUI

struct Lists: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var tripToShow = Trip(city: "", lists: [], tripDetails: TripDetails(pref: []), sustainableLeaf: "", url: "")
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
                            self.list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
                             = "false"


                        }else{
                            self.list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
                             = "true"

                        }
                        self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
                        print(list.rows)
                        
                       
////                                .rows[trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows.firstIndex(where: {$0.title == item.title})!].
//                        trips.handleUpdate(newValueTrip: trip)
                       
//                        withAnimation(.linear) {
                            
                           
                            self.listViewModel.updateItem(item: item)
                            
                            

                            
                            
                    
                                                                                                                        
//                        }
                    }
                    
            }.onDelete(perform: delete)
            
           
            
            
            
            
            
            

        }
        
        .navigationBarItems(leading: Button(action:{
            presentAlert.toggle()
            
            
        },label: {
            Text("Add")
        }).textFieldAlert(isPresented: $presentAlert, title: "Insert your new item", text: "", placeholder: "", action: {newText in
            
            if !(newText?.isEmpty ?? false){
                //on cancel crash
                self.list.rows.append(Row(category: "any", title: newText!, sustainable: "", description: "", season: "", checked: "false"))
                self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
                self.listViewModel.refresh(rows: list.rows)
            }
            
        }),
        trailing: EditButton()
        )
        
        .listStyle(DefaultListStyle())
      
        .navigationTitle(title)

        .onAppear{
            self.list = trips.listOfTrips[trips.listOfTrips.firstIndex(where: { $0.city == trip.city })!].lists.first(where: {$0.name == title})!
            self.listViewModel.setItems(rows: list.rows)
        }
        .onDisappear{
            updatePersistence(trip: self.trip)
        }
    }
    
    private func updatePersistence(trip: Trip){
        self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
        
        self.trips.handleUpdate(newValueTrip: trip)
        
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            
            
            self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows.remove(at: first)
            self.listViewModel.refresh(rows: self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows)
            
            
            
            
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
