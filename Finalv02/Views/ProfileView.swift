//
//  ProfileView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
               // avatar
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
                

            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    
    func profile(user: User) -> some View {
        
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            
            
            // info: name, email, member
            VStack(alignment: .leading){
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                } .padding()
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }.padding()
                HStack {
                    Text("Member since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                } .padding()
            } .padding()
            
            // signout
            Button("Log out") {
                viewModel.logOut()
            }
            .tint(.red)
            .padding()
            Spacer()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
