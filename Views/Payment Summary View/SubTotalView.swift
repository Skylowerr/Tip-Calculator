//
//  SubTotalView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 6.09.2025.
//

import SwiftUI

struct SubTotalView: View {
    let title : LocalizedStringKey
    let titleFont: Font
    
    let amount: String //String, double değil
    let amountFont: Font
    
    var body: some View {
        VStack{
            Text(title)
                .font(titleFont)
                .foregroundStyle(.secondary)
            Text(amount)
                .font(amountFont)
                .foregroundStyle(.myDarkGreen)
        }
        .frame(maxWidth: .infinity) //MARK: Buradaki .infinity ne işe yarıyor
        //VStack içindeyken → ortalama yerine tüm satırı doldurur.
        //HStack içindeyken → kardeş görünümlerle eşit bölüşür.
        //.background(.red)
    }
}

#Preview {
    SubTotalView(
        title: "Bill",
        titleFont: .largeTitle,
        amount: "19.99",
        amountFont: .largeTitle
    )
}
