//
//  CardListView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 28/05/22.
//

import SwiftUI

struct CardListView: View {
    
    var systemName: String
    var name: String
    var counter: String
    
    var body: some View{
        
        HStack{
            
            VStack(alignment: .leading){
                
                Image(systemName: systemName)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                    .clipShape(Circle())
                
                Text(name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.primary)
            }
            Spacer()
            Text(counter)
                .font(.title2)
                .fontWeight(.semibold)
            
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
                List {
                    CardListView(systemName: "tshirt.fill", name: "Clothes", counter: "6")
                }
    }
}

