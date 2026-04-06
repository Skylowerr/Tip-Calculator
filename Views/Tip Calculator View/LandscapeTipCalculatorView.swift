//
//  LandscapeTipCalculatorView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 11.09.2025.
//

import SwiftUI

struct LandscapeTipCalculatorView: View {
    /*
     @State private var tipPercentage = 20
     @State private var bill: Double = 0.0
     @State private var split: Int = 1
     */

    //MARK: ÜSTTEKİLER YERİNE NEDEN ALTTAKİNİ KULLANDIK
    @State private var tipModel : TipModel = TipModel(tipPercentage: 20, split: 1, bill: 0.0)
    @State private var isFocused: Bool = false
    
    
    
    let maxSplit: Int = 10
    
    
    var body: some View {
        ZStack{
            //BackgroundView()
            
            HStack{
                VStack(alignment: .leading) {
                    TitleView()
                    EnterTotalView(bill: $tipModel.bill, isFocused: $isFocused)
                    
                    HStack{
                        ChooseTipView(tipPercentage: $tipModel.tipPercentage)
                        SplitView(split: $tipModel.split, alignment: .center)


                    }

                }
                
                
                
                
                //MARK: PAYMENT SUMMARY
                if !isFocused {
                //    Text("PAYMENT SUMMARY")
                    PaymentSummaryView(tipModel: tipModel)
                }

            }
            .padding()
        }
        
        //MARK: BURAYI ANLAT
        .onTapGesture {
            UIApplication
                .shared
                .sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
        }
    }
}

//MARK: Sola yatırır
#Preview("Lanscape", traits: .landscapeLeft) {
    LandscapeTipCalculatorView()
}
