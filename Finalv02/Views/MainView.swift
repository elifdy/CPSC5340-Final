//
//  ContentView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    let buttonColor = Color(red: 255/255, green: 139/255, blue: 148/255)
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            accountView

        } else {
            
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            MeetingListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
