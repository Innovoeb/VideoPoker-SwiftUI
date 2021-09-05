//
//  CardGrid_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

struct CardGrid<Content: View>: View
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
        HStack
        {
            //Text("test")
            Image("10_of_spades")
                .resizable()
                .scaledToFill()
            Image("jack_of_spades2")
                .resizable()
                .scaledToFill()
            Image("queen_of_spades2")
                .resizable()
                .scaledToFill()
            Image("king_of_spades2")
                .resizable()
                .scaledToFill()
            Image("ace_of_spades2")
                .resizable()
                .scaledToFill()
        }
        .border(Color.green, width: 3)
        .frame(width: 350.0,
               height: 175.0)
    }
}
    
