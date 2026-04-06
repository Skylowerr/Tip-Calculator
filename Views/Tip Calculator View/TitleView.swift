//
//  TitleView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 11.09.2025.
//

import SwiftUI

struct TitleView: View {
    let alignment: TextAlignment
    //MARK: Otomatik olarak .center verebilmek için? ama direkt TextAlignment = .center diyemiyor muyuz sor
    //Evet, bu da olur ✅ Ama burada her zaman .center olur.
    //Artık dışarıdan değiştiremezsin çünkü let sabit. Yani şunu yapamazsın:
    //View’lerde çoğu zaman alignment gibi property’leri dışarıdan değiştirmek için init üzerinden almak mantıklı. Çünkü SwiftUI view’leri struct olduğu için, view’in içindeki var’lar runtime’da nadiren değiştirilir.
    
    init(alignment: TextAlignment = .center) {
        self.alignment = alignment
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .compact
    }
    
    var isPortraitPhone: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    
    var fontWeight : Font.Weight {
        isIPad ? .bold : .semibold
    }
    
    
    
    
    var body: some View {
        Text("Tip Calculator")
            .font(.largeTitle)
            .fontWeight(fontWeight)
            .multilineTextAlignment(alignment)
    }
}

#Preview {
    TitleView()
}
