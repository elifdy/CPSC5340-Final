//
//  MeetingListItemView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//


import SwiftUI

struct CardView: View {
    @StateObject var cardViewModel = CardViewModel()
    
    let item: MeetingItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.startDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                cardViewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(item: .init(id: "123", title: "Black Book", lengthInMinutes: 30, startDate: Date().timeIntervalSince1970,  createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
