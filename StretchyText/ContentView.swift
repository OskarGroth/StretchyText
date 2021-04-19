//
//  ContentView.swift
//  StretchyText
//
//  Created by Oskar Groth on 2021-04-17.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = "Hello World"
    
    var body: some View {
        VStack(spacing: 50) {
            StretchedTextView(text: text, font: .systemFont(ofSize: 22, weight: .medium), color: .labelColor)
                .frame(minHeight: 40)
                .padding([.leading, .trailing], 50)
            TextField("", text: $text)
                .frame(width: 100)
                .padding(.bottom, 20)
        }
        .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
