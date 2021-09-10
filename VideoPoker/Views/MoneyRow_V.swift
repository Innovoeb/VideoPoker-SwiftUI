//
//  MoneyRow_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import SwiftUI

struct MoneyRow: View
{
    @ObservedObject var dealer: Dealer
    
    
    var body: some View
    {
        HStack (alignment: .center)
        {
            if (dealer.gameInit == false)
            {
                Text("WIN 4000")
                    .frame(alignment: .leading)
            }
            else
            {
                if (dealer.playerWonHand == true)
                {
                    Text("WIN \(dealer.winnings)")
                        .frame(alignment: .leading)
                }
                else
                {
                    Text("")
                        .frame(alignment: .leading)
                }
            }
            
            Spacer()
            Text("BET 5")
                .frame(alignment: .center)
            Spacer()
            Text("CREDIT \(dealer.credits)")
                .frame(alignment: .trailing)
        }
        .frame(width: 370.0, height: 50.0)
    }
}
