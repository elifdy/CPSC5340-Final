//
//  MLButton.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//

import SwiftUI

import SwiftUI

struct MLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
      
    }
}
struct MLButton_Previews: PreviewProvider {
    static var previews: some View {
        MLButton(title: "Value", background: .pink){
            //action
        }
    }
}
