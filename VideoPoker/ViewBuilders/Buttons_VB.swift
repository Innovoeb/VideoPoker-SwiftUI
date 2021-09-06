//
//  Buttons_VB.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import SwiftUI

struct Buttons<Content: View>: View
{
    let content: Content
    
    @ObservedObject var dealer = Dealer()
    //@StateObject var dealer = Dealer()
    //@EnvironmentObject var dealer: Dealer
    
    init(@ViewBuilder content: () -> Content)
    {
        self.content = content()
    }
    
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
            Button("DEAL")
            {
                // MARK: Testing if JSON Was Parsed Correctly
//                for i in dealer.cards
//                {
//                    print(i.name)
//                }
                dealer.deal()
            }
            .frame(alignment: .trailing)
            //.environmentObject(dealer)
        }
        .frame(width: .infinity,
        height: 50.0)
    }
}
