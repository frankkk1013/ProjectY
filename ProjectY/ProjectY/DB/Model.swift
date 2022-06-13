//
//  Model.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 31/05/22.
//

import Foundation

struct TripDetails: Codable{
    var pref: [pagePref]
    
}

struct RowV: Codable{
//    let id = UUID()
   
    var checked: String
    var title: String
    var sustainable: String
    var description: String
    var category: String
    var season: String
    
}

struct ToDoListV: Codable{
//    var category: String
//    let id = UUID()
    var name: String
    var rows: [RowV]
    var completePercent: String
}

struct Row: Codable, Identifiable{
    let id = UUID()
    var category: String
    var title: String
    var sustainable: String
    var description: String
    var season: String
    var checked: String
}

struct ToDoList: Codable, Identifiable{
//    var category: String
    let id = UUID()
    var name: String
    var rows: [Row]
    var completePercent: String
}

struct Trip: Codable, Identifiable{
    let id = UUID()
    var city: String
    var lists: [ToDoList]           // Array di to do list
    var tripDetails: TripDetails    // Preferenze legate al trip scelte nella fase di aggiunta
    var sustainableLeaf: String
    var url: String
}

public struct DbConfig: Codable {
    var trip: [String]
    
}

public struct DbConfigList: Codable {
    var list: [String]
}

//CLASSE PER LA PERSISTENZA DEI TRIP
class UseTrip: ObservableObject{
    
    @Published var listOfTrips: [Trip] = [Trip]()
    @Published var db = DbConfig(trip: [])    // Object of our db
    @Published var dbLocation: URL? = nil           // Our url to db json file
    @Published var listsFolderUrl: URL? = nil
    
    init(){
        //load trips
        loadTrips()
        print(listsFolderUrl)
        
        
    }
    
    func loadTrips(){
        
        do {
            // check db file
            let dbInitLocation = try FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let dbURL = dbInitLocation.appendingPathComponent("trips.json")
            let dbExists = FileManager().fileExists(atPath: dbURL.path)
            
            if dbExists {
                // do catch -> check if something goes wrong to handle errors
                // Init our flashdecks and cards folder url
                listsFolderUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                // we use do catch because Data() can return an error and we need to handle it
                // Data() is used to read an URL location (our db file in that case)
                let data = try Data(contentsOf: dbURL)
                // we need a decoder to decode our json file (we use .self because we want to decode an array but not create a new one
                let decodedData = try JSONDecoder().decode([Trip].self, from: data)
                
                // after we load our data we set our flashdecks var to them
                listOfTrips = decodedData
                dbLocation.self = dbURL

                print("hello")
                print(listOfTrips)
                

            } else {
                let dbEncoded = try JSONEncoder().encode(db)
                try dbEncoded.write(to: dbURL)
                
                listsFolderUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                dbLocation.self = dbURL
                print(listsFolderUrl)
            }
            print(listsFolderUrl)
            
        } catch {
            print(error)
        }
    }
    
    func calculateAvg(trip: Trip) -> Int{
        var countLeaf: Int = 0
        var countNot: Int = 0
        var avg: Int = 0
        
            trip.lists.forEach{ list in
                list.rows.forEach{ row in
                    if row.sustainable == "true"{
                        countLeaf+=1
                        print("trueeee")
                        
                    }else{
                        if row.sustainable == "false" && row.description != "" {
                            countNot+=1
                            print("falseee")
                            
                        }
                    }
                    
                }
                
            }
        
        print(countLeaf)
        print(countNot)
        avg = (countLeaf) / (countNot)
        print(avg)
        return avg
        
                
    }
            
        
        
    
    /*dopo questo chiamare aggiornamento tramite use list*/
    
    func handleUpdate(newValueTrip: Trip) -> Bool{
        
        do {
            for (index, trip) in listOfTrips.enumerated(){
                if newValueTrip.city == trip.city{
                    
                    listOfTrips[index] = newValueTrip
                    listOfTrips[index].sustainableLeaf = String(calculateAvg(trip: newValueTrip))
                    print(try FileManager.default.removeItem(at: URL(string: "\(listsFolderUrl!.absoluteString)trips.json")!))
                    
                    // Encoding new deck to json
                    let jsonData = try JSONEncoder().encode(listOfTrips)
                    
                    // Creating file path and appending new name
                    
                    print(try jsonData.write(to: URL(string: "\(listsFolderUrl!.absoluteString)trips.json")!))
                    // Writing the data in folder
//                        try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
//                    useList.handleUpdate(newValueList: newValueTrip.lists)
                    
                    
                    
                    return true
                }
            }
            return false
        } catch {
            print(error)
            return false
        }
        
        
    }
    
    func handleDelete(newValueTrip: Trip) -> Bool{
        
        do {
            for (index, trip) in listOfTrips.enumerated(){
                if newValueTrip.city == trip.city{
                    
                    listOfTrips.remove(at: index)
                    try FileManager.default.removeItem(at: URL(string: "\(listsFolderUrl!.absoluteString)trips.json")!)
                    
                    // Encoding new deck to json
                    let jsonData = try JSONEncoder().encode(listOfTrips)
                    
                    // Creating file path and appending new name
                    
                    try jsonData.write(to: URL(string: "\(listsFolderUrl!.absoluteString)trips.json")!)
                    // Writing the data in folder
//                        try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                    
                    return true
                }
            }
            return false
        } catch {
            print(error)
            return false
        }
        
    }
    
    /*mi aspetto che all avvio dell app venga instanziata una classe di tipo UseList che dopo aver caricato le
     liste quelle modificate dall utente le passi come parametro a questa funzione
     e che a newValueTrip entri nella funzione con le liste di default già assegnate
     */
    
    func CreateTrip(newValueTrip: Trip, currentModifiedLists: [ToDoList]) -> Bool {
        var newValue: Trip = newValueTrip
        
        var flag = false
        do{
            listOfTrips.forEach { name in
                if(name.city == newValueTrip.city){
                    flag = true
                }
            }
            
            //Controlla se l'utente ha personalizzato una lista
            //Controlla nella cartella utente
            // se modificata non prendere quella di default dal Bundle
            for (index_newValue, listAdded) in newValue.lists.enumerated(){
                currentModifiedLists.forEach{ list in
                    if listAdded.name == list.name{
                        
                        newValue.lists[index_newValue] = list
                    }
                    
                }
                
            }
            
            if(flag == false){
                var trip = newValueTrip
                let avg = calculateAvg(trip: newValueTrip)
//                print("avg \(avg)")
                trip.sustainableLeaf = String(avg)
                listOfTrips.append(trip)
                let jsonData = try JSONEncoder().encode(listOfTrips)
    //            try FileManager.default.removeItem(at: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                try jsonData.write(to: URL(string: "\(listsFolderUrl!.absoluteString)trips.json")!)
                return true
            }
            
            return false
            
        }catch{
            return false
        }
        
        
        
    }
    
    
    
    
    
}

//non dimenticare di salvare e riprendere in futuro liste modificate dall utente



//gestione db liste modificate

class LocalJson: ObservableObject{
    
    private var defaultLists: [ToDoList] = [ToDoList]()

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([ToDoList].self,
                                                       from: jsonData)
            
            defaultLists = decodedData
            
            
        } catch {
           
        }
    }
}


class UseList: ObservableObject{
    
    var lists: [ToDoList] = [ToDoList]()
//    @Published var db = DbConfig(progress: [])    // Object of our db
    @Published var dbLocation: URL? = nil           // Our url to db json file
    @Published var listsFolderUrl: URL? = nil
    @Published var db = DbConfigList(list: [])
    
    init(){
        //load lists
    }
    
    func loadLists(){
        
        do {
            // check db file
            let dbInitLocation = try FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let dbURL = dbInitLocation.appendingPathComponent("lists.json")
            let dbExists = FileManager().fileExists(atPath: dbURL.path)
            
            if dbExists {
                // do catch -> check if something goes wrong to handle errors
                // Init our flashdecks and cards folder url
                listsFolderUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                // we use do catch because Data() can return an error and we need to handle it
                // Data() is used to read an URL location (our db file in that case)
                let data = try Data(contentsOf: dbURL)
                // we need a decoder to decode our json file (we use .self because we want to decode an array but not create a new one
                let decodedData = try JSONDecoder().decode([ToDoList].self, from: data)
                
                // after we load our data we set our flashdecks var to them
                lists = decodedData
                dbLocation.self = dbURL

                print("hello")
                print(lists)
                

            } else {
                let dbEncoded = try JSONEncoder().encode(db)
                try dbEncoded.write(to: dbURL)
                
                listsFolderUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                dbLocation.self = dbURL
                print(lists)
            }
            print(listsFolderUrl)
            
        } catch {
            print(error)
        }
    }
    
    func handleUpdate(newValueList: ToDoList) -> Bool{
        do {
            
            for (index, list) in lists.enumerated(){
                if newValueList.name == list.name{
                    
                    
                    
                    lists[index] = newValueList
                    lists[index].completePercent = "0"
                    try FileManager.default.removeItem(at: URL(string: "\(listsFolderUrl!.absoluteString)lists.json")!)
                    
                    // Encoding new deck to json
                    let jsonData = try JSONEncoder().encode(lists)
                    
                    // Creating file path and appending new name
                    
                    try jsonData.write(to: URL(string: "\(listsFolderUrl!.absoluteString)trips.json")!)
                    // Writing the data in folder
//                        try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                    
                    return true
                }
            }
            return false
        } catch {
            print(error)
            return false
        }
        
        
    }
    
    func handleDelete(newValueList: ToDoList) -> Bool{
        
        do {
            for (index, list) in lists.enumerated(){
                if newValueList.name == list.name{
                    
                    lists.remove(at: index)
                    try FileManager.default.removeItem(at: URL(string: "\(listsFolderUrl!.absoluteString)lists.json")!)
                    
                    // Encoding new deck to json
                    let jsonData = try JSONEncoder().encode(lists)
                    
                    // Creating file path and appending new name
                    
                    try jsonData.write(to: URL(string: "\(listsFolderUrl!.absoluteString)lists.json")!)
                    // Writing the data in folder
//                        try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                    
                    return true
                }
            }
            return false
        } catch {
            print(error)
            return false
        }
        
    }
    
    func CreateList(newValueList: ToDoList) -> Bool {
        
        var flag = false
        do{
            lists.forEach { list in
                if(list.name == newValueList.name){
                    flag = true
                }
            }
            
            if(flag == false){
                lists.append(newValueList)
                let jsonData = try JSONEncoder().encode(lists)
    //            try FileManager.default.removeItem(at: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                try jsonData.write(to: URL(string: "\(listsFolderUrl!.absoluteString)lists.json")!)
                return true
            }
            
            return false
            
        }catch{
            return false
        }
        
        //Controlla se l'utente ha personalizzato una lista
        //Controlla nella cartella utente
        // se modificata non prendere quella di default dal Bundle
        
    }
    
    
    
    
    
    
}











////CLASSE PER LA PERSISTENZA DELLE PREFERENZE LEGATE AL TRIP
//
//class UsePreferences: ObservableObject{
//
//    var preferences: TripDetails = TripDetails(pref: [])
////    @Published var db = DbConfig(progress: [])    // Object of our db
//    @Published var dbLocation: URL? = nil           // Our url to db json file
//    @Published var TripDetailsFolderUrl: URL? = nil
//
//
//
//
//}



extension JSONSerialization {
    
    static func loadJSON(withFilename filename: String) throws -> Any? {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try Data(contentsOf: fileURL)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves])
            return jsonObject
        }
        return nil
    }
    
    static func save(jsonObject: Any, toFilename filename: String) throws -> Bool{
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
            try data.write(to: fileURL, options: [.atomicWrite])
            return true
        }
        
        return false
    }
}
