//
//  LogoView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import SwiftUI

struct LogoView: View {
    let titleColor = Color(red: 40/255, green: 147/255, blue:146/255)
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 150)
            .padding()
        Text("Book Club Organizer")
            .foregroundColor(titleColor)
            .fontWeight(.semibold)
            .font(Font.custom("AmericanTypewriter", size: 24))
            .padding()
    }
}


struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
