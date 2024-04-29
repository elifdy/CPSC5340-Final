//
//  NewItemView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import SwiftUI

struct DetailEditView: View {
    @StateObject var newItemViewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Meeting")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            Form{
                Section(header: Text("Meeting Details")){
                    TextField("Meeting Title", text: $newItemViewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    HStack {
                        DatePicker("Date", selection: $newItemViewModel.startDate, displayedComponents: .date)
                        Spacer()
                    }
                    
                    HStack {
                        DatePicker("Time", selection: $newItemViewModel.startDate, displayedComponents: .hourAndMinute)
                        Spacer()
                    }
                    HStack {
                        Slider(value: $newItemViewModel.lengthInMinutesAsDouble, in: 5...60, step: 1) {
                            Text("Length")
                        }
                        Spacer()
                        Text("\(newItemViewModel.lengthInMinutes) minutes")
                    }
                  }

                Section(header: Text("Participants")) {
                    ForEach(newItemViewModel.attendees) { attendee in
                        Text(attendee.name)
                    }
                    .onDelete { indices in
                        newItemViewModel.attendees.remove(atOffsets: indices)
                    }
                    HStack {
                        TextField("New Attendee", text: $newItemViewModel.newAttendeeName)
                        Button(action: {
                            let newAttendee = Attendee(id: UUID(), name: newItemViewModel.newAttendeeName)
                            newItemViewModel.attendees.append(newAttendee)
                            newItemViewModel.newAttendeeName = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }
                        .disabled(newItemViewModel.newAttendeeName.isEmpty)
                    }
                }
                    
                MLButton(
                    title: "Save",
                    background: .pink
                ){
                    if newItemViewModel.canSave {
                        newItemViewModel.save()
                        newItemPresented = false
                    } else {
                        newItemViewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $newItemViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due data that is today or newer"))
            }

        }
    }
}
//struct NewItemView: View {
//    @StateObject var newItemViewModel = NewItemViewModel()
//    @Binding var newItemPresented: Bool
//    
//    var body: some View {
//        VStack {
//            Text("New Meeting")
//                .font(.system(size: 32))
//                .bold()
//                .padding(.top, 50)
//
//            Form {
//                Section(header: Text("Meeting Details")) {
//                    TextField("Meeting Title", text: $newItemViewModel.title)
//                    DatePicker("Date & Time", selection: $newItemViewModel.startDate, displayedComponents: [.date, .hourAndMinute])
//                    Slider(value: $newItemViewModel.lengthInMinutesAsDouble, in: 5...120, step: 1) {
//                        Text("Length (\(newItemViewModel.lengthInMinutes) minutes)")
//                    }
//                }
//
//                Section(header: Text("Participants")) {
//                    ForEach(newItemViewModel.attendees) { attendee in
//                        Text(attendee.name)
//                    }
//                    .onDelete { indices in
//                        newItemViewModel.attendees.remove(atOffsets: indices)
//                    }
//                    HStack {
//                        TextField("New Attendee", text: $newItemViewModel.newAttendeeName)
//                        Button(action: {
//                            let newAttendee = Attendee(id: UUID(), name: newItemViewModel.newAttendeeName)
//                            newItemViewModel.attendees.append(newAttendee)
//                            newItemViewModel.newAttendeeName = ""
//                        }) {
//                            Image(systemName: "plus.circle.fill")
//                        }
//                        .disabled(newItemViewModel.newAttendeeName.isEmpty)
//                    }
//                }
//                Button("Save") {
//                    if newItemViewModel.canSave {
//                        newItemViewModel.save()
//                        newItemPresented = false
//                    } else {
//                        newItemViewModel.showAlert = true
//                    }
//                }
//            }
//            .alert(isPresented: $newItemViewModel.showAlert) {
//                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due data that is today or newer"))
//            }
//        }
//    }
//}


struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(newItemPresented: Binding(get: {
            return true
            
        }, set: { _ in
        }))
    }
}
