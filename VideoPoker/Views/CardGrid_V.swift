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
            VStack
            {
                if (dealer.slot1Held == true || dealer.gameInit == false)
                {
                    Text("HELD")
                }
                Image(dealer.slot1)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == true)
                        {
                            dealer.slot1Held = true
                        }
                    }
            }
            VStack
            {
                if (dealer.slot2Held == true || dealer.gameInit == false)
                {
                    Text("HELD")
                }
                Image(dealer.slot2)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == true)
                        {
                            dealer.slot2Held = true
                        }
                    }
            }
            VStack
            {
                if (dealer.slot3Held == true || dealer.gameInit == false)
                {
                    Text("HELD")
                }
                Image(dealer.slot3)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == true)
                        {
                            dealer.slot3Held = true
                        }
                    }
            }
            VStack
            {
                if (dealer.slot4Held == true || dealer.gameInit == false)
                {
                    Text("HELD")
                }
                Image(dealer.slot4)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == true)
                        {
                            dealer.slot4Held = true
                        }
                    }
            }
            VStack
            {
                if (dealer.slot5Held == true || dealer.gameInit == false)
                {
                    Text("HELD")
                }
                Image(dealer.slot5)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == true)
                        {
                            dealer.slot5Held = true
                        }
                    }
            }
        }
        .frame(width: 360.0, height: 300.0)
    }
}
    
