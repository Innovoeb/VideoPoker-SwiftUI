//
//  CardGrid_V.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct CardGrid: View
{
    @ObservedObject var dealer: Dealer
    
    var body: some View
    {
        HStack
        {
            Image(dealer.slot1)
                .resizable()
                .scaledToFit()
                .onTapGesture
                {
                    print("card was tapped")
                }
            Image(dealer.slot2)
                .resizable()
                .scaledToFit()
            Image(dealer.slot3)
                .resizable()
                .scaledToFit()
            Image(dealer.slot4)
                .resizable()
                .scaledToFit()
            Image(dealer.slot5)
                .resizable()
                .scaledToFit()
        }
        .border(Color.green, width: 2)
        .frame(width: 360.0, height: 300.0)
    }
}
    
