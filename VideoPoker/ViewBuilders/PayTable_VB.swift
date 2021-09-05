//
//  PayTable_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct PayTable<Content: View>: View
{
    // let content denotes that it will conform to the View protocol
    let content: Content // add content as a prop and initialize it
        // @ViewBuilder as a param to allow closures to provide multiple child views
        init(@ViewBuilder content: () -> Content)
        {
            self.content = content()
        }
    
    var body: some View
    {
        // build your custom view builder here
        HStack (alignment: .center, spacing: -10.0)
        {
            // winning hands
            VStack (spacing: 10)
            {
                Text("ROYAL FLUSH")
                Text("STRAIGHT FLUSH")
                Text("4 OF A KIND")
                Text("FULL HOUSE")
                Text("FLUSH")
                Text("STRAIGHT")
                Text("3 OF A KIND")
                Text("TWO PAIR")
                Text("JACKS OR BETTER")
            }
            .padding(.all)
            .frame(width: 200.00,
                   height: .infinity,
                   alignment: .leading)
            // X 1
            VStack (spacing: 10)
            {
                Text("250")
                Text("50")
                Text("25")
                Text("9")
                Text("6")
                Text("4")
                Text("3")
                Text("2")
                Text("1")
            }
            .padding(.all)
            .frame(width: 70.0,
                   height: .infinity,
                   alignment: .trailing)
            // X 2
            VStack (spacing: 10)
            {
                Text("500")
                Text("100")
                Text("50")
                Text("18")
                Text("12")
                Text("8")
                Text("6")
                Text("4")
                Text("2")
            }
            .padding(.all)
            .frame(width: 70.0,
                   height: .infinity,
                   alignment: .trailing)
            
            // X 3
            VStack (spacing: 10)
            {
                Text("750")
                Text("150")
                Text("75")
                Text("27")
                Text("18")
                Text("12")
                Text("9")
                Text("6")
                Text("3")
            }
            .padding(.all)
            .frame(width: 70.0,
                   height: .infinity,
                   alignment: .trailing)
            // X 4
            VStack (spacing: 10)
            {
                Text("1000")
                Text("200")
                Text("100")
                Text("36")
                Text("24")
                Text("16")
                Text("12")
                Text("8")
                Text("4")
            }
            .padding(.all)
            .frame(width: 90.0,
                   height: .infinity,
                   alignment: .trailing)
            // X 5
            VStack (spacing: 10)
            {
                Text("4000")
                Text("250")
                Text("125")
                Text("45")
                Text("30")
                Text("20")
                Text("15")
                Text("10")
                Text("5")
            }
            .padding(.all)
            .frame(width: 90.0,
                   height: .infinity,
                   alignment: .trailing)
        }
        .frame(width: .infinity)
    }
}
