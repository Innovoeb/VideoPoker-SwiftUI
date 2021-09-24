//
//  CardGrid_V.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct CardGrid: View
{
    @EnvironmentObject var dealer: Dealer
    
    var body: some View
    {
        HStack
        {
            VStack
            {
                if ( (dealer.gameInit == false) || (dealer.slot1Held == true) )
                {
                    Text("HELD")
                }
                Image(dealer.slot1)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == false) // after RNG I change the deal status
                        {
                            if (dealer.slot1Held == false)
                            {
                                dealer.slot1Held = true
                            }
                            else
                            {
                                dealer.slot1Held = false
                            }
                        }
                    }
            }
            VStack
            {
                if ( (dealer.gameInit == false) || (dealer.slot2Held == true) )
                {
                    Text("HELD")
                }
                Image(dealer.slot2)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == false) // after RNG I change the deal status
                        {
                            if (dealer.slot2Held == false)
                            {
                                dealer.slot2Held = true
                            }
                            else
                            {
                                dealer.slot2Held = false
                            }
                        }
                    }
            }
            VStack
            {
                if ( (dealer.gameInit == false) || (dealer.slot3Held == true) )
                {
                    Text("HELD")
                }
                Image(dealer.slot3)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == false) // after RNG I change the deal status
                        {
                            if (dealer.slot3Held == false)
                            {
                                dealer.slot3Held = true
                            }
                            else
                            {
                                dealer.slot3Held = false
                            }
                        }
                    }
            }
            VStack
            {
                if ( (dealer.gameInit == false) || (dealer.slot4Held == true) )
                {
                    Text("HELD")
                }
                Image(dealer.slot4)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == false) // after RNG I change the deal status
                        {
                            if (dealer.slot4Held == false)
                            {
                                dealer.slot4Held = true
                            }
                            else
                            {
                                dealer.slot4Held = false
                            }
                        }
                    }
            }
            VStack
            {
                if ( (dealer.gameInit == false) || (dealer.slot5Held == true) )
                {
                    Text("HELD")
                }
                Image(dealer.slot5)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture
                    {
                        if (dealer.gameInit == true && dealer.firstDeal == false) // after RNG I change the deal status
                        {
                            if (dealer.slot5Held == false)
                            {
                                dealer.slot5Held = true
                            }
                            else
                            {
                                dealer.slot5Held = false
                            }
                        }
                    }
            }
        }
        .frame(width: 360.0, height: 300.0)
    }
}
    
