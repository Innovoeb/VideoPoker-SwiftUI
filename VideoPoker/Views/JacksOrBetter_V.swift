//
//  JacksOrBetter_V.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct JacksOrBetter_V: View
{
    //@ObservedObject var dealer = Dealer()
    //@StateObject var dealer = Dealer()
    
    init()
    {
//        dealer.newGame()
//        print(dealer.slot1)
    }
    
    var body: some View
    {
        // main container
        VStack
        {
            PayTable{}
            Spacer()
            CardGrid{}
                //.environmentObject(dealer)
            MoneyRow{}
            Buttons{}
        }
    }
}

struct JacksOrBetter_V_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JacksOrBetter_V()
        }
    }
}
