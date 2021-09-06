//
//  VideoPokerApp.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

@main
struct VideoPokerApp: App {
    
//    @ObservedObject var dealer = Dealer()
    //@EnvironmentObject var dealer: Dealer
//    
//    init()
//    {
//        dealer.newGame()
//        print("App: \(dealer.slot1!)")
//    }
    var body: some Scene {
        WindowGroup {
            JacksOrBetter_V()
        }
    }
}
