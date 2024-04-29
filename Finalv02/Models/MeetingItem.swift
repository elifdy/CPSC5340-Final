//
//  MeetingListItem.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//


import Foundation

struct MeetingItem: Codable, Identifiable {
    let id: String
    let title: String
    let lengthInMinutes: Int
    let startDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool

    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

struct Attendee: Identifiable, Codable {
    let id: UUID
    var name: String
}


extension MeetingItem {
    static var emptyMeeting: MeetingItem {
        MeetingItem(id: UUID().uuidString,
                    title: "",
                    lengthInMinutes: 5,
                    startDate: DateComponents(calendar: .current, year: 2024, month: 4, day: 28, hour: 15, minute: 40).date!.timeIntervalSince1970,  //
                    createdDate: Date().timeIntervalSince1970,
                    isDone: false)
    }
}
