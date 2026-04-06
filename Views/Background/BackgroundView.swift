//
//  BackgroundView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 6.09.2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            Color
                .white
                .opacity(0.9)
                .ignoresSafeArea()
            
            SinePathView()
        }
    }
}

#Preview {
    BackgroundView()
}
