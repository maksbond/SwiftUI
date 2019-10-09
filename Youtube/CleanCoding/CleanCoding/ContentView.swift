//
//  ContentView.swift
//  CleanCoding
//
//  Created by Maksym Bondar on 10/8/19.
//  Copyright © 2019 Maksym Bondar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Continue")
                        .modifier(CustomModifier(paddingHorizontal:8.0))
                })
                
                Button(action: {
                    
                }, label: {
                    Text("More Details")
                    .modifier(CustomModifier(fontSize: 10, backgroundColor: .green))
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                        .modifier(CustomModifier(paddingVertical: 5.0, backgroundColor: .red))
                })
            }
        }
    }
}

struct CustomModifier: ViewModifier {
    @State var paddingHorizontal: CGFloat = 14.0
    @State var paddingVertical: CGFloat = 10.0
    @State var fontSize: CGFloat = 16.0
    @State var backgroundColor = Color.blue
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.white)
            .font(.system(size: fontSize))
            .padding(.horizontal, paddingHorizontal)
            .padding(.vertical, paddingVertical)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1))
                    .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 1)))
            .cornerRadius(4)
            .shadow(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 0, y: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
