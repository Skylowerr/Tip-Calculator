//
//  TipCalculatorView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 4.09.2025.
//

import SwiftUI

struct TipCalculatorView: View {
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

            VStack{
                //TODO: Text("TITLE VIEW")
                TitleView()
                Spacer()
                
                VStack(alignment: .leading){
                 //   Text("ENTER TOTAL VIEW")
                    EnterTotalView(bill: $tipModel.bill, isFocused: $isFocused)
                  //  Text("CHOOSE TIP VIEW")
                    ChooseTipView(tipPercentage: $tipModel.tipPercentage)

                }
                
                //TODO: Text("SPLIT VIEW")
                SplitView(split: $tipModel.split, alignment: .center)
                
                
                Spacer()
                
                //MARK: PAYMENT SUMMARY
                if !isFocused {
                //    Text("PAYMENT SUMMARY")
                    PaymentSummaryView(tipModel: tipModel)
                    Spacer()
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

#Preview {
    TipCalculatorView()
}
