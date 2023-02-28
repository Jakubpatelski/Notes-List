//
//  DetailView.swift
//  PopUP
//
//  Created by Jakub Patelski on 27/02/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var text: String


    var body: some View {
        VStack{
            TextField("", text: $text)
                .multilineTextAlignment(.center)
                .font(.system(size: 32, weight: .medium))
//            Link("Google", destination: URL(string: "https://google.com")!)
            
            Link(destination: URL(string: "https://google.com")!, label: {
                Text("Go To Google")
                    .bold()
                    .frame(width: 200, height: 50)
                    .foregroundColor(.red)
                    .background(Color.black)
                    .cornerRadius(10)
                
            })
                
 
        }
        .padding()

            
        }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: .constant("Test"))
    }
}
