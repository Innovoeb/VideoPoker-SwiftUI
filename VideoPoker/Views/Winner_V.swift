//
//  Winner_V.swift
//  VideoPoker
//
//  Created by Beovonni on 9/8/21.
//

import SwiftUI

struct Winner: View
{
    @EnvironmentObject var dealer: Dealer
    
    
    var body: some View
    {
        Text(dealer.statement)
    }
}
