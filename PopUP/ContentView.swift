//
//  ContentView.swift
//  PopUP
//
//  Created by Jakub Patelski on 26/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showNewScreen: Bool = false
    @State private var myList = [
        Notes(title: "First Note"),
        Notes(title: "Second Note"),
        Notes(title: "Third Note")
    ]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("Notes"){
                        ForEach($myList) { item in
                            NavigationLink(destination: DetailView(text: item.title)) {
                                Text(item.title.wrappedValue)
                            }
                        }
                        .onDelete { indexSet in
                            myList.remove(atOffsets: indexSet)
                        }
                    }
    
                        Button(action: { showNewScreen.toggle() }, label: {
                            Text("Add Note")
                                .foregroundColor(Color.blue)
                        })
                    .navigationTitle("Notes")

                }
            }
        }
        .sheet(isPresented: $showNewScreen) {
            NewScreen(showNewScreen: $showNewScreen, list: $myList)
        }
    }
}




//struct NewScreen: View {
//    @Binding var showNewScreen: Bool
//    @State var title = ""
//    @Binding var list: [Notes]
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 30) {
//                TextField("Enter text", text: $title)
//                    .padding()
//                    .background(Color(hue: 0.011, saturation: 0.014, brightness: 0.843).cornerRadius(10))
//                    .foregroundColor(.black)
//                    .font(.headline)
//
//                Button(action: {
//                    if (!title.isEmpty){
//                        showNewScreen.toggle()
//                        list.append(Notes(title: title))
//                    }
//                    
//                }) {
//                    Text("ADD NOTE")
//                }
//                .font(.system(size: 20, weight: .medium))
//                .accentColor(.white)
//                .frame(width: 200, height: 50)
//                .background(Color.blue.cornerRadius(10).shadow(radius: 10))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.white, lineWidth: 3)
//                )
//            }
//            .padding()
//            .navigationTitle("New Note")
//        }
//    }
//}

struct Notes: Identifiable, Codable{
    var id = UUID()
    var title: String
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        NewScren()
    }
}
