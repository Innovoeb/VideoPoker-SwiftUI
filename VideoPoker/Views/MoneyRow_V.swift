//
//  MoneyRow_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import SwiftUI

struct MoneyRow: View
{
    @EnvironmentObject var dealer: Dealer
    
    
    var body: some View
    {
        HStack ()
        {
            if (dealer.gameInit == false)
            {
                Text("WIN 4000")
                Spacer()
            }
            else
            {
                if (dealer.playerWonHand == true)
                {
                    Text("WIN \(dealer.winnings)")
                    Spacer()
                    Spacer()
                }
                else
                {
                    Text("")
                    Spacer()
                    Spacer()
                }
            }
            //Spacer()
            //Spacer()
            Text("BET 5")
                //.frame(alignment: .center)
            Spacer()
            Text("CREDIT \(dealer.credits)")
                //.frame(alignment: .trailing)
        }
        .frame(height: 50.0)
    }
}
