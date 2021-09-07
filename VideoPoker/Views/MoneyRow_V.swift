//
//  MoneyRow_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import SwiftUI

struct MoneyRow: View
{
    var body: some View
    {
        HStack (alignment: .center)
        {
            Text("WIN 4000")
                .frame(alignment: .leading)
            Spacer()
            Text("BET 5")
                .frame(alignment: .center)
            Spacer()
            Text("CREDIT $4000")
                .frame(alignment: .trailing)
        }
        .frame(width: 370.0, height: 50.0)
    }
}
