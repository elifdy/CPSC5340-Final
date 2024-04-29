//
//  NewItemViewModel.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class DetailEditViewModel: ObservableObject {
    @Published var title = ""
    @Published var startDate = Date()
    @Published var lengthInMinutes = 30
    @Published var showAlert = false
    @Published var attendees: [Attendee] = []
    @Published var newAttendeeName = ""
    
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    
    
    init() {}
    
//    func save(){
//        guard canSave else {
//            return
//        }
//            // current user
//        guard let uId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        
//        // create model
//        let newId = UUID().uuidString
//        
//        let newItem = MeetingItem(
//            id: newId,
//            title: title,
//            lengthInMinutes: lengthInMinutes,
//            startDate: startDate.timeIntervalSince1970,
//            createdDate: Date().timeIntervalSince1970,
//            isDone: false
//        )
//        
//        
//        //save model
//        
//        let db = Firestore.firestore()
//        
//        
//        db.collection("users")
//            .document(uId)
//            .collection("meetings")
//            .document(newId)
//            .setData(newItem.asDictionary())
//    }
    
    
    func save() {
            guard let uId = Auth.auth().currentUser?.uid else {
                return
            }

            let newId = UUID().uuidString
            let newItem = MeetingItem(id: newId, 
                                      title: title,
                                      lengthInMinutes: lengthInMinutes,
                                      startDate: startDate.timeIntervalSince1970, 
                                      createdDate: Date().timeIntervalSince1970,
                                      isDone: false)

            let db = Firestore.firestore()
            let batch = db.batch()

            let meetingRef = db.collection("users").document(uId).collection("meetings").document(newId)
            batch.setData(newItem.asDictionary(), forDocument: meetingRef)
            for attendee in attendees {
                let attendeeRef = meetingRef.collection("attendees").document(attendee.id.uuidString)
                batch.setData(["id": attendee.id.uuidString, "name": attendee.name], forDocument: attendeeRef)
            }
            batch.commit()
        }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard startDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}

