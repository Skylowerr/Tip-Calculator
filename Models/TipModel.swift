//
//  TipModel.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 10.09.2025.
//

import Foundation
import SwiftUI


struct TipModel : Identifiable {
    let id = UUID()
    
    
    var tipPercentage: Int
    var split: Int
    var bill: Double
    
    // Bill = $100 tip = 10% -> $10
    var tip: Double{
        bill * Double(tipPercentage) / 100.0
    }
    
    //Including the tip
    var total: Double{
        bill + tip
    }
    
    //MARK: Hazır ayarlanmış bir NumberFormatter nesnesi oluşturuyor (currency formatında).
    //✅ formatter hazır ayarlanmış bir NumberFormatter oluyor.
    //✅ Tekrardan her yerde NumberFormatter() yazıp ayar yapmak zorunda kalmıyorsun.
    let formatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .currency //→ value’yi parasal formatta gösterecek ($123.45 gibi).
        return formatter
    }()
    
    //MARK: BU KOD NE İŞE YARIYOR. YAPISINI ANLAT
    func formattedAmount(value: Double, split: Int) -> String{
        let newValue = value / Double(split)
        return formatter
            .string(from: NSNumber(value: newValue)) ?? "$0" //formatter.string(from: ...) → NumberFormatter ile bunu para formatında string’e çeviriyor.
        //?? "$0" → eğer formatter bir şey döndüremezse, hata olmaması için $0 döner.
    }
    
    //TODO: Calculate based on inputs
    //Kişi Başı 11$ olacak
    var totalPerPerson : String {
        formattedAmount(value: total, split: split)
    }
    
    //Kişi başı 10$ olacak
    var billPerPerson : String {
        formattedAmount(value: bill, split: split)
    }
    
    //50$ bill 5 kişi ise 5$ tip -> 5/5 = Kişi başı 1$ olacak
    var tipPerPerson : String {
        formattedAmount(value: tip, split: split)
    }
}
