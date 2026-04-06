//
//  PaymentSummaryView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 6.09.2025.
//

import SwiftUI

struct PaymentSummaryView: View {
    
    //ipad support
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .compact
    }
    
    var isPortraitPhone: Bool {
        //yatay dar, dikeyde uzun
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    
    var font: Font {
        isIPad ? .largeTitle : .headline
    }
    
    let tipModel: TipModel
    
    var body: some View {
        //MARK: GroupBox kullanımına bak
        GroupBox {
            VStack{
                SubTotalView(
                    title: "Total per Person",
                    titleFont: font,
                    amount: tipModel.totalPerPerson,
                    amountFont: font
                )
                .frame(maxHeight: .infinity) //MARK: Neden maxHeight dedik
                //Eğer .frame(maxHeight: .infinity) koymazsan, her SubTotalView sadece içeriği kadar kısa olur.
                //.maxHeight: .infinity sayesinde → hepsi aynı yükseklikle esner ve daha dengeli görünür.
                
                
                HStack{
                    SubTotalView(
                        title: "Bill",
                        titleFont: font,
                        amount: tipModel.billPerPerson,
                        amountFont: font
                    )
                    .frame(maxHeight: .infinity) //MARK: Neden maxHeight dedik
                    
                    SubTotalView(
                        title: "Tip",
                        titleFont: font,
                        amount: tipModel.tipPerPerson,
                        amountFont: font
                    )
                    .frame(maxHeight: .infinity) //MARK: Neden maxHeight dedik
                }
            }
        } label: {
            Label("Summary", systemImage: "book")
                .foregroundStyle(.secondary)
                .font(font)
                .fontWeight(.semibold)
        }
        .backgroundStyle(.myLightGreen.opacity(0.8))
        .clipShape(.rect(cornerRadius: 20))

    }
}

#Preview {
    VStack{
        RoundedRectangle(cornerRadius: 20)
            .fill(.blue.opacity(0.3))
        
        PaymentSummaryView(
            tipModel: .init(tipPercentage: 10, split: 3, bill: 100)
        )
    }.padding()
}
