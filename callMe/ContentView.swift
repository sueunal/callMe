//
//  ContentView.swift
//  callMe
//
//  Created by sueun kim on 2023/02/12.
//

import SwiftUI

struct ContentView: View {
    @State private var expressionButton : String = ""
    var tempNumber :String = ""
    enum ButtonNumber : String {
        case one, two, three, fow, five, six, seven, eight, nine, zero
        case hash, asterisk
        var buttonDisplayName : String {
            switch self {
            case .one:
                return "1"
            case .two:
                return "2"
            case .three:
                return "3"
            case .fow:
                return "4"
            case .five:
                return "5"
            case .six:
                return "6"
            case .seven:
                return "7"
            case .eight:
                return "8"
            case .nine:
                return "9"
            case .zero:
                return "0"
            case .hash:
                return "#"
            case .asterisk:
                return "*"
            }
        }
        var ButtonColor: Color {
            switch self {
            case .one, .two,.three,.fow,.five,.six ,.seven,.eight,.nine ,.zero,.hash, .asterisk:
                return Color("buttonColor")
            }
        }
    }
    
    let buttonNumber : [[ButtonNumber]] = [
        [.one, .two, .three],
        [.fow, .five, .six],
        [.seven, .eight, .nine],
        [.asterisk, .zero,.hash]
    ]
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                HStack{
                    Text(expressionButton)
                        .font(.system(size:40))
                }
                ForEach(buttonNumber,id:\.self){ line in
                    HStack{
                        ForEach(line, id:\.self){ item in
                            Button{
                                expressionButton += item.buttonDisplayName
                            } label:{
                                Text(item.buttonDisplayName)
                                    .frame(width:70,height: 70)
                                    .foregroundColor(.white)
                                    .background(item.ButtonColor)
                                    .font(.system(size:30))
                                    .bold()
                                    .cornerRadius(40)
                                    .padding(7)
                            }
                        }
                    }
                }
                    HStack{
                        Image(systemName: "phone.fill")
                            .frame(width:70,height: 70)
                            .foregroundColor(.white)
                            .background(.green)
                            .font(.system(size:30))
                            .cornerRadius(40)
                            .padding(7)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
