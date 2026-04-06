//
//  SelectButtonView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 6.09.2025.
//

import SwiftUI

struct SelectButtonView: View {
    let percentage : Int
    let color1 : Color = .myDarkGreen
    let color2: Color = .white
    
    @Binding var selectedTip : Int
    @Binding var tipPercentage : Int
    
    let shadowOpacity = 0.3
    
    var isPressed : Bool{
        selectedTip == percentage
    }
    
    
    
    
    
    var body: some View {
        Text("\(percentage)")
            .padding()
            .foregroundStyle(isPressed ? color2 : color1)
            .background(isPressed ? color1 : color2.opacity(0.7))
            .clipShape(Capsule())
            .shadow(
                color: isPressed ? color2.opacity(shadowOpacity) : color1.opacity(shadowOpacity),
                radius: 3,
                x: 2,
                y: 2
            )
            .onTapGesture {
                withAnimation {
                    selectedTip = percentage
                    tipPercentage = percentage
                }
            }
            
    }
}

#Preview {
    ZStack {
        Color.myDarkGreen.ignoresSafeArea().opacity(0.7)
        SelectButtonView(
            percentage: 10,

            selectedTip: .constant(5),
            tipPercentage: .constant(TipPercentage.ten.rawValue) //MARK: Yani .rawValue enum’un karşılık gelen değerini verir.
        )
    }
}
