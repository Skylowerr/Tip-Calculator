//
//  SineWaveView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 6.09.2025.
//

import SwiftUI

struct SineWaveView: View {
    //amplitude → animasyon sırasında yükseklik değişkeni (başta 0, sonra height değerine animasyonla geçiyor).
    //MARK: height ile aynı şeyi olmalı. CGFloat?
    @State private var amplitude: CGFloat? = 0.0
    let fillColor: Color
    let height: CGFloat?
    //MARK: BURADAKİ init ile .init arasındaki fark ne? Ne işe yararlar, ne zaman ve nerelerde kullanılırlar
    //init → struct/class içinde tanımlama tarafında
    //.init → kullanım tarafında
    init(fillColor: Color, height: CGFloat? = nil) {
        self.fillColor = fillColor
        self.height = height
    }
    
    var body: some View {
        SineWave()
            .fill(fillColor.gradient)
            .shadow(color: fillColor, radius:3 , x:3, y:3)
            .frame(height: amplitude)
            .onAppear{
                //MARK: extraBounce neo luyor
                /*
                 .bouncy → yay gibi ileri geri sekme efekti verir.

                 extraBounce → o sekmenin ne kadar fazla zıplama yapacağını belirler.
                 */
                //0.05 olduğu için çok hafif seker
                withAnimation(.bouncy(duration: 2, extraBounce: 0.05)) {
                    amplitude = height //BUNEY
                }
            }
    }
}

//MARK: BURASI NE İŞE YARIYOR, Shape nedir in rect: nedir -> Path nedir ne işe yarıyor anlat
struct SineWave: Shape{
    func path(in rect: CGRect) -> Path{ //Bu fonksiyonun içine sana bir dikdörtgen (CGRect) verilir.
        //Sen bu alan içinde bir Path (yani çizgi/çizim talimatları) oluşturursun.
        //Path() ->Çizim komutlarını içerir (move, line, curve …).
        var path = Path()
        let width = rect.width
        let height = rect.height
        let delta = rect.height / 2
        let midY = rect.midY
        
        //TODO: Go to the left-center
        //Ortadan dalgalı bir eğri çiziliyor.
        path.move(
            to: CGPoint(x: 0, y: midY)
        )
        //Draw sine curve from the left-center
        path.addCurve(
            to: CGPoint(x: width, y: midY),
            control1: CGPoint(x: 0.25*width, y: midY-delta),
            control2: CGPoint(x: 0.75*width, y: midY+delta),
        )
        
        //Go up
        path.addLine(to: CGPoint(x:width, y: midY-height/2))
        
        //Go left (x:0)
        path.addLine(to: CGPoint(x:0, y: midY-height/2))

        
        
        return path
    }
}

#Preview {
    SineWaveView(fillColor: .green.opacity(0.7), height: 200)
}
