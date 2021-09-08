//
//  Dealer_VM.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import Foundation

class Dealer: ObservableObject
{
    @Published var cards = [Card]()
    
    @Published var slot1 = ""
    @Published var slot2 = ""
    @Published var slot3 = ""
    @Published var slot4 = ""
    @Published var slot5 = ""
    
    var value1 = 0
    var value2 = 0
    var value3 = 0
    var value4 = 0
    var value5 = 0
    var suit1 = ""
    var suit2 = ""
    var suit3 = ""
    var suit4 = ""
    var suit5 = ""
    
    //@Published var highPair = false
    @Published var statement = ""
    
    // button props
    @Published var dealButton = ""
    @Published var credits = "CREDIT 4000"
    
    @Published var slot1Held = false
    @Published var slot2Held = false
    @Published var slot3Held = false
    @Published var slot4Held = false
    @Published var slot5Held = false
    
    @Published var gameInit = false
    @Published var firstDeal = false
    
    
    init()
    {
        // create an instance of data service and get the data
        self.cards = DataService.getLocalData()
        // show spades royal flush before a game is started/first spin
        slot1 = cards[9].image
        slot2 = cards[10].image
        slot3 = cards[11].image
        slot4 = cards[12].image
        slot5 = cards[0].image
        //dump(self.cards)
        dealButton = "START"
    }
    
    func RNG ()
    {
        let shuffleCard = cards.randomElement()!.image
        
        //MARK: oooh look at the pretty trees :)
        
        // slot1
        if (slot1 == slot2)
        {
            slot1 = shuffleCard
        }
        else if (slot1 == slot3)
        {
            slot1 = shuffleCard
        }
        else if (slot1 == slot4)
        {
            slot1 = shuffleCard
        }
        else if (slot1 == slot5)
        {
            slot1 = shuffleCard
        }
        
        // slot2
        if (slot2 == slot1)
        {
            slot2 = shuffleCard
        }
        else if (slot2 == slot3)
        {
            slot2 = shuffleCard
        }
        else if (slot2 == slot4)
        {
            slot2 = shuffleCard
        }
        else if (slot2 == slot5)
        {
            slot2 = shuffleCard
        }
        
        // slot3
        if (slot3 == slot1)
        {
            slot3 = shuffleCard
        }
        else if (slot3 == slot2)
        {
            slot3 = shuffleCard
        }
        else if (slot3 == slot4)
        {
            slot3 = shuffleCard
        }
        else if (slot3 == slot5)
        {
            slot3 = shuffleCard
        }
        
        // slot4
        if (slot4 == slot1)
        {
            slot4 = shuffleCard
        }
        else if (slot4 == slot2)
        {
            slot4 = shuffleCard
        }
        else if (slot4 == slot3)
        {
            slot4 = shuffleCard
        }
        else if (slot4 == slot5)
        {
            slot4 = shuffleCard
        }
        
        // slot5
        if (slot5 == slot1)
        {
            slot5 = shuffleCard
        }
        else if (slot5 == slot2)
        {
            slot5 = shuffleCard
        }
        else if (slot5 == slot3)
        {
            slot5 = shuffleCard
        }
        else if (slot5 == slot4)
        {
            slot5 = shuffleCard
        }
    }
    
    // method that "shuffles the cards" by grabbing 5 random elements of the [Cards] array
    func deal ()
    {
        // new game is started if deal button pressed initially
        if (gameInit == false)
        {
            gameInit = true
            dealButton = "DEAL"
            firstDeal = true
            
            slot1 = cards.randomElement()!.image
            slot2 = cards.randomElement()!.image
            slot3 = cards.randomElement()!.image
            slot4 = cards.randomElement()!.image
            slot5 = cards.randomElement()!.image
            RNG()
        }
        // game is already active
        else
        {
            if (firstDeal == true)
            {
               if (slot1Held == false)
               {
                RNG()
               }
                if (slot2Held == false)
                {
                 slot2 = cards.randomElement()!.image
                 RNG()
                }
                if (slot3Held == false)
                {
                 slot3 = cards.randomElement()!.image
                 RNG()
                }
                if (slot4Held == false)
                {
                 slot4 = cards.randomElement()!.image
                 RNG()
                }
                if (slot5Held == false)
                {
                 slot5 = cards.randomElement()!.image
                 RNG()
                }
                firstDeal = false
            }
            // reset props on a new deal and deal 5 new cards
            else
            {
                slot1Held = false
                slot2Held = false
                slot3Held = false
                slot4Held = false
                slot5Held = false
                firstDeal = true
                slot1 = cards.randomElement()!.image
                slot2 = cards.randomElement()!.image
                slot3 = cards.randomElement()!.image
                slot4 = cards.randomElement()!.image
                slot5 = cards.randomElement()!.image
                RNG()
            }
        }
    }
    
    
    func payout ()
    {
        if (gameInit == true)
        {
            // loop through cards.json for the element of the assoiciated card slots
            for i in cards
            {
                if String(i.image) == slot1
                {
                    // grab value and suit of slot1
                    value1 = i.value
                    suit1 = i.suit
                }
                if String(i.image) == slot2
                {
                    // grab value and suit of slot1
                    value2 = i.value
                    suit2 = i.suit
                }
                if String(i.image) == slot3
                {
                    // grab value and suit of slot1
                    value3 = i.value
                    suit3 = i.suit
                }
                if String(i.image) == slot4
                {
                    // grab value and suit of slot1
                    value4 = i.value
                    suit4 = i.suit
                }
                if String(i.image) == slot5
                {
                    // grab value and suit of slot1
                    value5 = i.value
                    suit5 = i.suit
                }
            }
            
            // MARK: High Pair

            // high pair (jacks)
            if (value1 == 11 && value2 == 11 || value1 == 11 && value3 == 11 || value1 == 11 && value4 == 11 || value1 == 11 && value5 == 11 || value2 == 11 && value3 == 11 || value2 == 11 && value4 == 11 || value2 == 11 && value5 == 11 || value3 == 11 && value4 == 11 || value3 == 11 && value5 == 11 || value4 == 11 && value5 == 11)
            {
                if (firstDeal == false)
                {
                    // update UI to show winning hand statement
                    statement = "Jacks or Better"
                    // add money to credits
                }
            }
            
            // high pair (queens)
            if (value1 == 12 && value2 == 12 || value1 == 12 && value3 == 12 || value1 == 12 && value4 == 12 || value1 == 12 && value5 == 12 || value2 == 12 && value3 == 12 || value2 == 12 && value4 == 12 || value2 == 12 && value5 == 12 || value3 == 12 && value4 == 12 || value3 == 12 && value5 == 12 || value4 == 12 && value5 == 12)
            {
                if (firstDeal == false)
                {
                    // update UI to show winning hand statement
                    statement = "Jacks or Better"
                    // add money to credits
                }
            }
            
            // high pair (kings)
            if (value1 == 13 && value2 == 13 || value1 == 13 && value3 == 13 || value1 == 13 && value4 == 13 || value1 == 13 && value5 == 13 || value2 == 13 && value3 == 13 || value2 == 13 && value4 == 13 || value2 == 13 && value5 == 13 || value3 == 13 && value4 == 13 || value3 == 13 && value5 == 13 || value4 == 13 && value5 == 13)
            {
                if (firstDeal == false)
                {
                    // update UI to show winning hand statement
                    statement = "Jacks or Better"
                    // add money to credits
                }
            }
            
            // reset statement
            if (firstDeal == true)
            {
                statement = ""
            }
        }
    }
}
