//
//  CustomTipView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 6.09.2025.
//

import SwiftUI

struct CustomTipView: View {
    //MARK: BUNLARA DIŞARIDAN ERİŞMİMİZ VAR
    @Binding var selectedTip : Int
    @Binding var tipPercentage : Int
    
    @FocusState private var focusState : Bool
    
    var isSelected : Bool{
        selectedTip == tipPercentage
    }
    
    var fgColor: Color {
        isSelected ? .myDarkGreen : .white
    }
    
    var bgColor: Color {
        isSelected ? .white : .myDarkGreen
    }
    var body: some View {
        ZStack(alignment: .bottom){
            TextField(
                "Custom",
                value: $tipPercentage,
                format: .percent
            )
            .focused($focusState)
            .onChange(of: focusState) { oldValue, newValue in
                selectedTip = TipPercentage.custom.rawValue
            }
            .fixedSize() //MARK: BUNEY
            .keyboardType(.numberPad)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(fgColor)
            .padding()
            .background(bgColor.opacity(0.7))
            .clipShape(Capsule())
            .shadow(
                color: fgColor.opacity(0.3),
                radius: 3,
                x: 2,
                y: 2
            )
            Text("Custom")
                .font(.caption)
                .foregroundStyle(.secondary)
            
        }
    }
}

#Preview {
    CustomTipView(
        selectedTip: .constant(5),
        tipPercentage: .constant(TipPercentage.twenty.rawValue)
    )
}
