//
//  JacksOrBetter_V.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct JacksOrBetter: View
{
    @EnvironmentObject var dealer: Dealer
    
    var body: some View
    {
        // main container
        VStack
        {
            PayTable()
            Spacer()
            Spacer()
            CardGrid()
            Winner()
            Spacer()
            MoneyRow()
            Buttons()
        }
        .padding(.horizontal)
    }
}

struct JacksOrBetter_V_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JacksOrBetter()
        }
    }
}
