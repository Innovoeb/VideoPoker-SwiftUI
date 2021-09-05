//
//  JacksOrBetter_V.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct JacksOrBetter_V: View
{
    var body: some View
    {
        VStack
        {
            PayTable{}
                //.padding()
//                .frame(height: .infinity)
                .border(Color.white, width: 2)
            Spacer()
            CardGrid{}
        }
        // redundant ???
        .frame(width: .infinity,
               height: .infinity)
        
    }
}

struct JacksOrBetter_V_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JacksOrBetter_V()
        }
    }
}
