//
//  SplitView.swift
//  Tip Calculator
//
//  Created by Emirhan Gökçe on 11.09.2025.
//

import SwiftUI

struct SplitView: View {
    @Binding var split : Int
    private let maxSplit = 10
    let alignment : Alignment //MARK: Alignment ile TextAlignment farkı ne
    
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
    
    var body: some View {
        VStack(spacing:0) {
            Text("Split")
                .font(font)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: alignment)

            HStack{
                Button {
                    //TODO: Action
                    //split = split > 1 ? split - 1 : split
                    if split > 1{
                        split -= 1

                    }
                    
                } label: {
                    Image(systemName: "minus.circle.fill")

                }
                
                Text("\(split)")
                
                Button {
                    //TODO: Action
                    //split = split < maxSplit ? split + 1 : split
                    if split < maxSplit{
                        split += 1
                    }


                } label: {
                    Image(systemName: "plus.circle.fill")

                }

            }
            .font(.title)
            .foregroundStyle(.myDarkGreen)
            .padding()
        }
    }
}

#Preview {
    SplitView(split: .constant(1), alignment: .center)
        .padding()
}
