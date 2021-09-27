//
//  VideoPokerApp.swift
//  VideoPoker
//
//  Created by Beovonni on 9/4/21.
//

import SwiftUI

@main
struct VideoPokerApp: App {
    
    var body: some Scene {
        WindowGroup {
            JacksOrBetter()
                .environmentObject(Dealer())
        }
    }
}
