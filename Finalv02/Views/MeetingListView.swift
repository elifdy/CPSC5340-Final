//
//  MeetingListView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct MeetingListView: View {
    @StateObject var viewModel: MeetingListViewModel
    @FirestoreQuery var items: [MeetingItem]

    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/meetings"
        )
        self._viewModel = StateObject(
            wrappedValue: MeetingListViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items) {
                    item in
                    CardView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
               
            }
            .navigationTitle("Book Clubs")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                DetailEditView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
       
    }
}

struct MeetingListView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingListView(userId: "ApZalVPSxWd5NSaSIBdASY0ItRo2")
    }
}
