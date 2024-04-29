//
//  NewItemView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import SwiftUI

struct DetailEditView: View {
    @StateObject var detailEditViewModel = DetailEditViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Book Club")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            Form{
                Section(header: Text("Meeting Details")){
                    TextField("Book Name", text: $detailEditViewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    HStack {
                        DatePicker("Date", selection: $detailEditViewModel.startDate, displayedComponents: .date)
                        Spacer()
                    }
                    
                    HStack {
                        DatePicker("Time", selection: $detailEditViewModel.startDate, displayedComponents: .hourAndMinute)
                        Spacer()
                    }
                    HStack {
                        Slider(value: $detailEditViewModel.lengthInMinutesAsDouble, in: 5...60, step: 1) {
                            Text("Length")
                        }
                        Spacer()
                        Text("\(detailEditViewModel.lengthInMinutes) minutes")
                    }
                  }

                Section(header: Text("Participants")) {
                    ForEach(detailEditViewModel.attendees) { attendee in
                        Text(attendee.name)
                    }
                    .onDelete { indices in
                        detailEditViewModel.attendees.remove(atOffsets: indices)
                    }
                    HStack {
                        TextField("New Attendee", text: $detailEditViewModel.newAttendeeName)
                        Button(action: {
                            let newAttendee = Attendee(id: UUID(), name: detailEditViewModel.newAttendeeName)
                            detailEditViewModel.attendees.append(newAttendee)
                            detailEditViewModel.newAttendeeName = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }
                        .disabled(detailEditViewModel.newAttendeeName.isEmpty)
                    }
                }
                    
                MLButton(
                    title: "Save",
                    background: .pink
                ){
                    if detailEditViewModel.canSave {
                        detailEditViewModel.save()
                        newItemPresented = false
                    } else {
                        detailEditViewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $detailEditViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due data that is today or newer"))
            }

        }
    }
}



struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(newItemPresented: Binding(get: {
            return true
            
        }, set: { _ in
        }))
    }
}
