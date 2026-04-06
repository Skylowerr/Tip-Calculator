//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 4.09.2025.
//

import SwiftUI

struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .compact
    }init(horizontalSizeClass: UserInterfaceSizeClass? = nil, verticalSizeClass: UserInterfaceSizeClass? = nil) {
        self.horizontalSizeClass = horizontalSizeClass
        self.verticalSizeClass = verticalSizeClass
    }
    
    var isPortraitPhone: Bool {
        //yatay dar, dikeyde uzun
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }

    var body: some View {
        ZStack{
            BackgroundView()
            VStack {
                if isIPad || isPortraitPhone{
                    TipCalculatorView()
                    
                }else{
                    LandscapeTipCalculatorView()
                }
            }
            .padding()
        }

    }
}

#Preview {
    MainView()
}
