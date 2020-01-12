//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Maksym Bondar on 12.01.2020.
//  Copyright © 2020 Maksym Bondar. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case divide, multiply, minus, plus, equal
    case ac, plusMinus, percent
    case zero, dot, one, two, three, four, five, six, seven, eight, nine
    
    var title: String {
        switch self {
        
        case .divide: return "÷"
        case .multiply: return "x"
        case .minus: return "-"
        case .plus: return "+"
        case .equal: return "="

        case .dot: return "."
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
            
        case .ac: return "AC"
        case .plusMinus: return "±"
        case .percent: return "%"
        }
    }
    
    var background: Color  {
        switch self {
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        case .divide, .multiply, .minus, .plus, .equal:
            return .orange
        default:
            return Color(.darkGray)
        }
    }
    
    var width: CGFloat {
        if self == .zero {
            return (UIScreen.main.bounds.width - 5 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    var height: CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    func receivedInput(button: CalculatorButton) {
        self.display = button.title
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 12) {
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }

}

struct CalculatorButtonView: View {
    
    var button: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            self.env.receivedInput(button: self.button)
        }) {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: button.width, height: button.height)
                .foregroundColor(.white)
                .background(button.background)
                .cornerRadius(button.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
