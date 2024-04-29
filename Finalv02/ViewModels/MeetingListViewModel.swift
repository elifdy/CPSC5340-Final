//
//  MeetingListViewModel.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import Foundation
import FirebaseFirestore

class MeetingListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("meetings")
            .document(id)
            .delete()
        
    }
}
