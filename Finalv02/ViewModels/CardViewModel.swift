//
//  MeetingListItemViewModel.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation
class CardViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: MeetingItem)  {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("meetings")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
