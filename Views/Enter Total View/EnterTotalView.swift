//
//  EnterTotalView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 10.09.2025.
//

import SwiftUI

struct EnterTotalView: View {
    @Binding var bill : Double
    @State private var animate = false
    
    @FocusState private var focusState : Bool
    @Binding var isFocused : Bool
    
    //Device size class
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .compact
    }
    
    var isPortraitPhone: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    
    var font : Font {
        isIPad ? .title : .body
    }
    
    var color : Color{
        animate ? .pink : .purple
    }
    
    var scale : CGFloat{
        animate ? 0.95 : 1.0
    }
    
    var offsetY : CGFloat{
        animate ? 3 : 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Enter total")
                .font(font)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
            
            //MARK: BURAYI ANLAT
            TextField(
                "Amount",
                value: $bill,
                //Locale.current.currency?.identifier → Cihazın o anki para birimi (ör. Türkiye’de "TRY").
                //?? "USD" → Eğer cihaz para birimi bulunamazsa USD kullan.
                format: .currency(code: Locale
                    .current
                    .currency?
                    .identifier ?? "USD"
                    )
            )
            //MARK: ALTTAKİ KODLARI ANLAT
            .focused($focusState)
            .onChange(of: focusState) { _, newValue in
                isFocused = newValue
            }
            //Klavyeyi sayı + nokta içeren (ondalık sayı yazmaya uygun) modda açar.
            .keyboardType(.decimalPad)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            //MARK: TextField içeriğini seçtiğin color ile çarpar → renk efekti.
            .colorMultiply(color)
            .scaleEffect(y: scale) //Y ekseninde ölçeklendirir (yazıyı uzatıp kısaltır).
            .offset(y: offsetY)
            .animation(
                .easeInOut(duration: 2).repeatForever(),
                value: animate //animate değişince animasyonu başlatır.
            )
            .onAppear{
                animate = true //Görünür olduğunda animate = true yapar → animasyon başlar.
            }
        }
    }
}

#Preview {
    VStack{
        EnterTotalView(bill: .constant(100), isFocused: .constant(true))
        EnterTotalView(bill: .constant(100), isFocused: .constant(false))

    }.padding()
}
