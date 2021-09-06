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
    @ObservedObject var dealer = Dealer()
    //@ObservedObject var dealer: Dealer
    //@EnvironmentObject var dealer: Dealer
    //@StateObject var dealer = Dealer()
    
    
    // @ViewBuilder as a param to allow closures to provide multiple child views
    init(@ViewBuilder content: () -> Content)
    {
        self.content = content()
        //self.dealer = Dealer()
        print(dealer.slot1)
    }
    
    var body: some View
    {
        HStack
        {
            Image(dealer.slot1)
                .resizable()
                .scaledToFit()
            Image(dealer.slot2)
                .resizable()
                .scaledToFit()
            Image(dealer.slot3)
                .resizable()
                .scaledToFit()
            Image(dealer.slot4)
                .resizable()
                .scaledToFit()
            Image(dealer.slot5)
                .resizable()
                .scaledToFit()
        }
        .border(Color.green, width: 2)
        .frame(width: .infinity,
               height: 175.0)
        //.environmentObject(dealer)
    }
}
    
