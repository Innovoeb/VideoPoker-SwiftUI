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
        // Pay Table
        HStack (alignment: .center)
        {
            // winning hands
            VStack (alignment: .leading)
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
            .padding(.trailing, 10.0)
            .scaledToFill()
            .border(Color.white, width: 2)
            // x1
            VStack (alignment: .center)
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
            .scaledToFill()
            // x2
            VStack (alignment: .center)
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
            .scaledToFill()
            // x3
            VStack (alignment: .center)
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
            .scaledToFill()
            // x4
            VStack (alignment: .center)
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
            .scaledToFill()
            // x5
            VStack (alignment: .center)
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
            .padding(.trailing, 20.0)
            .scaledToFill()
        }
        .border(Color.white, width: 2)
        .padding(.all)
        .frame(height: 200.0)
    }
}
