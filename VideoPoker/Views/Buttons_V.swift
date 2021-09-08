//
//  Buttons_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import SwiftUI

struct Buttons: View
{
    @ObservedObject var dealer: Dealer
    
    var body: some View
    {
        HStack
        {
            // help button
            Button("HELP")
            {
                print("help button was pressed")
            }
            .frame(alignment: .leading)
            Spacer()
            
            // denomination button
            Button("$1")
            {
                print("denomination button was pressed")
            }
            Spacer()
            // deal button
            Button(dealer.dealButton)
            {
                dealer.deal()
                dealer.payout()
            }
            .frame(alignment: .trailing)
        }
        .frame(width: 350.0, height: 50.0)
    }
}
