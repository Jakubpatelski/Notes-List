//
//  NewScreen.swift
//  PopUP
//
//  Created by Jakub Patelski on 28/02/2023.
//

import SwiftUI

struct NewScreen: View {
    @Binding var showNewScreen: Bool
    @State var title = ""
    @Binding var list: [Notes]
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                TextField("Enter text", text: $title)
                    .padding()
                    .background(Color(hue: 0.011, saturation: 0.014, brightness: 0.843).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)

                Button(action: {
                    if (!title.isEmpty){
                        showNewScreen.toggle()
                        list.append(Notes(title: title))
                    }
                    
                }) {
                    Text("ADD NOTE")
                }
                .font(.system(size: 20, weight: .medium))
                .accentColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue.cornerRadius(10).shadow(radius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 3)
                )
            }
            .padding()
            .navigationTitle("New Note")
        }
    }
}


struct NewScreen_Previews: PreviewProvider {
    @State static var list = [
    Notes(title: "hello")]
    @State static var showNewScreen = false
    static var previews: some View {
        NewScreen(showNewScreen: $showNewScreen, list: $list)
    }
}
