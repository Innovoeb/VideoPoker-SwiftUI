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
    @Published var credits = 0
    @Published var winnings = 0
    @Published var playerWonHand = false
    
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
        var trash1 = ""
        var trash2 = ""
        var trash3 = ""
        var trash4 = ""
        var trash5 = ""
        
        if (firstDeal == true)
        {
            print("1st Deal")
        }
        else
        {
            print("2nd Deal")
        }
        
        if (firstDeal == true)
        {
            // initially deal shuffled cards
            slot1 = cards.randomElement()!.image
            slot2 = cards.randomElement()!.image
            slot3 = cards.randomElement()!.image
            slot4 = cards.randomElement()!.image
            slot5 = cards.randomElement()!.image
            
            // slot 1
            while ( (slot1 == slot2) || (slot1 == slot3) || (slot1 == slot4) || (slot1 == slot5) )
            {
                slot1 = cards.randomElement()!.image
            }
            
            while ( (slot2 == slot1) || (slot2 == slot3) || (slot2 == slot4) || (slot2 == slot5) )
            {
                slot2 = cards.randomElement()!.image
            }
            
            while ( (slot3 == slot1) || (slot3 == slot2) || (slot3 == slot4) || (slot3 == slot5) )
            {
                slot3 = cards.randomElement()!.image
            }
            
            while ( (slot4 == slot1) || (slot4 == slot2) || (slot4 == slot3) || (slot4 == slot5) )
            {
                slot4 = cards.randomElement()!.image
            }
            
            while ( (slot5 == slot1) || (slot5 == slot2) || (slot5 == slot3) || (slot5 == slot4) )
            {
                slot5 = cards.randomElement()!.image
            }
        }
        // second deal
        else
        {
            
            // grab all thrown away cards first then deal new ones in the associated slot
            if (slot1Held == false)
            {
                trash1 = slot1
            }
            if (slot2Held == false)
            {
                trash2 = slot2
            }
            if (slot3Held == false)
            {
                trash3 = slot3
            }
            if (slot4Held == false)
            {
                trash4 = slot4
            }
            if (slot5Held == false)
            {
                trash5 = slot5
            }
            
            print("trash1 : \(trash1)")
            print("trash2 : \(trash2)")
            print("trash3 : \(trash3)")
            print("trash4 : \(trash4)")
            print("trash5 : \(trash5)")
            
            
            if (slot1Held == true)
            {
                print("card was held")
            }
            
            if (slot1Held == false)
            {

                repeat
                {
                    slot1 = cards.randomElement()!.image
                }
                // make sure newly dealt cards don't match thrown away cards or cards in other slots
                while ( (slot1 == slot2) || (slot1 == slot3) || (slot1 == slot4) || (slot1 == slot5) || (slot1 == trash1) || (slot1 == trash2) || (slot1 == trash3) || (slot1 == trash4) || (slot1 == trash5) )

            }
            if (slot2Held == false)
            {
                repeat
                {
                    slot2 = cards.randomElement()!.image
                }
                while ( (slot2 == slot1) || (slot2 == slot3) || (slot2 == slot4) || (slot2 == slot5) || (slot2 == trash1) || (slot2 == trash2) || (slot2 == trash3) || (slot2 == trash4) || (slot2 == trash5) )
            }
            if (slot3Held == false)
            {
                repeat
                {
                    slot3 = cards.randomElement()!.image
                }
                while ( (slot3 == slot1) || (slot3 == slot2) || (slot3 == slot4) || (slot3 == slot5) || (slot3 == trash1) || (slot3 == trash2) || (slot3 == trash3) || (slot3 == trash4) || (slot3 == trash5) )
            }
            if (slot4Held == false)
            {
                repeat
                {
                    slot4 = cards.randomElement()!.image
                }
                while ( (slot4 == slot1) || (slot4 == slot2) || (slot4 == slot3) || (slot4 == slot5) || (slot4 == trash1) || (slot4 == trash2) || (slot4 == trash3) || (slot4 == trash4) || (slot4 == trash5) )
            }
            if (slot5Held == false)
            {
                repeat
                {
                    slot5 = cards.randomElement()!.image
                }
                while ( (slot5 == slot1) || (slot5 == slot2) || (slot5 == slot3) || (slot5 == slot4) || (slot5 == trash1) || (slot5 == trash2) || (slot5 == trash3) || (slot5 == trash4) || (slot5 == trash5) )
            }
        
            trash1 = ""
            trash2 = ""
            trash3 = ""
            trash4 = ""
            trash5 = ""
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
            credits = 200
            winnings = 0
            firstDeal = true
        }
        
        if (gameInit == true)
        {
            if (firstDeal == true)
            {
                playerWonHand = false
                winnings = 0
                credits -= 5
                slot1Held = false
                slot2Held = false
                slot3Held = false
                slot4Held = false
                slot5Held = false
                RNG()
                firstDeal = false
            }
            else
            {
                // reset props on a new deal and deal 5 new cards
                RNG()
                firstDeal = true
            }
        }
    }
    
    
    func payout ()
    {
        var array = [Int]()
        var min:Int
        var max:Int
        
        
        
        var pairs = 0
        var lowPair = false
        var highPair = false
        var set = false
        var straight = false
        var flush = false
        var fullhouse = false
        var fourKind = false
        var straightFlush = false
        var royalFlush = false
        
        
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
        }
            
        // MARK: Pairs/Sets
            
        // pair/set 2s
        if (firstDeal == true && (value1 == 2 && value2 == 2) || (value1 == 2 && value3 == 2) || (value1 == 2 && value4 == 2) || (value1 == 2 && value5 == 2) || (value2 == 2 && value3 == 2) || (value2 == 2 && value4 == 2) || (value2 == 2 && value5 == 2) || (value3 == 2 && value4 == 2) || (value3 == 2 && value5 == 2) || (value4 == 2 && value5 == 2))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 2 && value2 == 2 && value3 == 2) || (value2 == 2 && value3 == 2 && value4 == 2) || (value3 == 2 && value4 == 2 && value5 == 2) || (value1 == 2 && value3 == 2 && value4 == 2) || (value1 == 2 && value4 == 2 && value5 == 2) || (value2 == 2 && value4 == 2 && value5 == 2) || (value1 == 2 && value3 == 2 && value5 == 2) || (value2 == 2 && value3 == 2 && value5 == 2) || (value1 == 2 && value2 == 2 && value5 == 2) || (value1 == 2 && value2 == 2 && value4 == 2))
        {
            set = true
        }
            
        // pair/set 3s
        if (firstDeal == true && (value1 == 3 && value2 == 3) || (value1 == 3 && value3 == 3) || (value1 == 3 && value4 == 3) || (value1 == 3 && value5 == 3) || (value2 == 3 && value3 == 3) || (value2 == 3 && value4 == 3) || (value2 == 3 && value5 == 3) || (value3 == 3 && value4 == 3) || (value3 == 3 && value5 == 3) || (value4 == 3 && value5 == 3))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 3 && value2 == 3 && value3 == 3) || (value2 == 3 && value3 == 3 && value4 == 3) || (value3 == 3 && value4 == 3 && value5 == 3) || (value1 == 3 && value3 == 3 && value4 == 3) || (value1 == 3 && value4 == 3 && value5 == 3) || (value2 == 3 && value4 == 3 && value5 == 3) || (value1 == 3 && value3 == 3 && value5 == 3) || (value2 == 3 && value3 == 3 && value5 == 3) || (value1 == 3 && value2 == 3 && value5 == 3) || (value1 == 3 && value2 == 3 && value4 == 3))
        {
            set = true
        }
            
            // pair/set 4s
        if (firstDeal == true && (value1 == 4 && value2 == 4) || (value1 == 4 && value3 == 4) || (value1 == 4 && value4 == 4) || (value1 == 4 && value5 == 4) || (value2 == 4 && value3 == 4) || (value2 == 4 && value4 == 4) || (value2 == 4 && value5 == 4) || (value3 == 4 && value4 == 4) || (value3 == 4 && value5 == 4) || (value4 == 4 && value5 == 4))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 4 && value2 == 4 && value3 == 4) || (value2 == 4 && value3 == 4 && value4 == 4) || (value3 == 4 && value4 == 4 && value5 == 4) || (value1 == 4 && value3 == 4 && value4 == 4) || (value1 == 4 && value4 == 4 && value5 == 4) || (value2 == 4 && value4 == 4 && value5 == 4) || (value1 == 4 && value3 == 4 && value5 == 4) || (value2 == 4 && value3 == 4 && value5 == 4) || (value1 == 4 && value2 == 4 && value5 == 4) || (value1 == 4 && value2 == 4 && value4 == 4))
        {
            set = true
        }
            
        // pair/set 5s
        if (firstDeal == true && (value1 == 5 && value2 == 5) || (value1 == 5 && value3 == 5) || (value1 == 5 && value4 == 5) || (value1 == 5 && value5 == 5) || (value2 == 5 && value3 == 5) || (value2 == 5 && value4 == 5) || (value2 == 5 && value5 == 5) || (value3 == 5 && value4 == 5) || (value3 == 5 && value5 == 5) || (value4 == 5 && value5 == 5))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 5 && value2 == 5 && value3 == 5) || (value2 == 5 && value3 == 5 && value4 == 5) || (value3 == 5 && value4 == 5 && value5 == 5) || (value1 == 5 && value3 == 5 && value4 == 5) || (value1 == 5 && value4 == 5 && value5 == 5) || (value2 == 5 && value4 == 5 && value5 == 5) || (value1 == 5 && value3 == 5 && value5 == 5) || (value2 == 5 && value3 == 5 && value5 == 5) || (value1 == 5 && value2 == 5 && value5 == 5) || (value1 == 5 && value2 == 5 && value4 == 5))
        {
            set = true
        }
            
        // pair/set 6s
        if (firstDeal == true && (value1 == 6 && value2 == 6) || (value1 == 6 && value3 == 6) || (value1 == 6 && value4 == 6) || (value1 == 6 && value5 == 6) || (value2 == 6 && value3 == 6) || (value2 == 6 && value4 == 6) || (value2 == 6 && value5 == 6) || (value3 == 6 && value4 == 6) || (value3 == 6 && value5 == 6) || (value4 == 6 && value5 == 6))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 6 && value2 == 6 && value3 == 6) || (value2 == 6 && value3 == 6 && value4 == 6) || (value3 == 6 && value4 == 6 && value5 == 6) || (value1 == 6 && value3 == 6 && value4 == 6) || (value1 == 6 && value4 == 6 && value5 == 6) || (value2 == 6 && value4 == 6 && value5 == 6) || (value1 == 6 && value3 == 6 && value5 == 6) || (value2 == 6 && value3 == 6 && value5 == 6) || (value1 == 6 && value2 == 6 && value5 == 6) || (value1 == 6 && value2 == 6 && value4 == 6))
        {
            set = true
        }
            
        // pair/set 7s
        if (firstDeal == true && (value1 == 7 && value2 == 7) || (value1 == 7 && value3 == 7) || (value1 == 7 && value4 == 7) || (value1 == 7 && value5 == 7) || (value2 == 7 && value3 == 7) || (value2 == 7 && value4 == 7) || (value2 == 7 && value5 == 7) || (value3 == 7 && value4 == 7) || (value3 == 7 && value5 == 7) || (value4 == 7 && value5 == 7))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 7 && value2 == 7 && value3 == 7) || (value2 == 7 && value3 == 7 && value4 == 7) || (value3 == 7 && value4 == 7 && value5 == 7) || (value1 == 7 && value3 == 7 && value4 == 7) || (value1 == 7 && value4 == 7 && value5 == 7) || (value2 == 7 && value4 == 7 && value5 == 7) || (value1 == 7 && value3 == 7 && value5 == 7) || (value2 == 7 && value3 == 7 && value5 == 7) || (value1 == 7 && value2 == 7 && value5 == 7) || (value1 == 7 && value2 == 7 && value4 == 7))
        {
            set = true
        }
            
        // pair/set 8s
        if (firstDeal == true && (value1 == 8 && value2 == 8) || (value1 == 8 && value3 == 8) || (value1 == 8 && value4 == 8) || (value1 == 8 && value5 == 8) || (value2 == 8 && value3 == 8) || (value2 == 8 && value4 == 8) || (value2 == 8 && value5 == 8) || (value3 == 8 && value4 == 8) || (value3 == 8 && value5 == 8) || (value4 == 8 && value5 == 8))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 8 && value2 == 8 && value3 == 8) || (value2 == 8 && value3 == 8 && value4 == 8) || (value3 == 8 && value4 == 8 && value5 == 8) || (value1 == 8 && value3 == 8 && value4 == 8) || (value1 == 8 && value4 == 8 && value5 == 8) || (value2 == 8 && value4 == 8 && value5 == 8) || (value1 == 8 && value3 == 8 && value5 == 8) || (value2 == 8 && value3 == 8 && value5 == 8) || (value1 == 8 && value2 == 8 && value5 == 8) || (value1 == 8 && value2 == 8 && value4 == 8))
        {
            set = true
        }
            
        // pair/set 9s
        if (firstDeal == true && (value1 == 9 && value2 == 9) || (value1 == 9 && value3 == 9) || (value1 == 9 && value4 == 9) || (value1 == 9 && value5 == 9) || (value2 == 9 && value3 == 9) || (value2 == 9 && value4 == 9) || (value2 == 9 && value5 == 9) || (value3 == 9 && value4 == 9) || (value3 == 9 && value5 == 9) || (value4 == 9 && value5 == 9))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 9 && value2 == 9 && value3 == 9) || (value2 == 9 && value3 == 9 && value4 == 9) || (value3 == 9 && value4 == 9 && value5 == 9) || (value1 == 9 && value3 == 9 && value4 == 9) || (value1 == 9 && value4 == 9 && value5 == 9) || (value2 == 9 && value4 == 9 && value5 == 9) || (value1 == 9 && value3 == 9 && value5 == 9) || (value2 == 9 && value3 == 9 && value5 == 9) || (value1 == 9 && value2 == 9 && value5 == 9) || (value1 == 9 && value2 == 9 && value4 == 9))
        {
            set = true
        }
            
        // pair/set 10s
        if (firstDeal == true && (value1 == 10 && value2 == 10) || (value1 == 10 && value3 == 10) || (value1 == 10 && value4 == 10) || (value1 == 10 && value5 == 10) || (value2 == 10 && value3 == 10) || (value2 == 10 && value4 == 10) || (value2 == 10 && value5 == 10) || (value3 == 10 && value4 == 10) || (value3 == 10 && value5 == 10) || (value4 == 10 && value5 == 10))
        {
            pairs += 1
            lowPair = true
        }
        if (firstDeal == true && (value1 == 10 && value2 == 10 && value3 == 10) || (value2 == 10 && value3 == 10 && value4 == 10) || (value3 == 10 && value4 == 10 && value5 == 10) || (value1 == 10 && value3 == 10 && value4 == 10) || (value1 == 10 && value4 == 10 && value5 == 10) || (value2 == 10 && value4 == 10 && value5 == 10) || (value1 == 10 && value3 == 10 && value5 == 10) || (value2 == 10 && value3 == 10 && value5 == 10) || (value1 == 10 && value2 == 10 && value5 == 10) || (value1 == 10 && value2 == 10 && value4 == 10))
        {
            set = true
        }

        // pair/set jacks
        if (firstDeal == true && (value1 == 11 && value2 == 11) || (value1 == 11 && value3 == 11) || (value1 == 11 && value4 == 11) || (value1 == 11 && value5 == 11) || (value2 == 11 && value3 == 11) || (value2 == 11 && value4 == 11) || (value2 == 11 && value5 == 11) || (value3 == 11 && value4 == 11) || (value3 == 11 && value5 == 11) || (value4 == 11 && value5 == 11))
        {
            pairs += 1
            highPair = true
        }
        if (firstDeal == true && (value1 == 11 && value2 == 11 && value3 == 11) || (value2 == 11 && value3 == 11 && value4 == 11) || (value3 == 11 && value4 == 11 && value5 == 11) || (value1 == 11 && value3 == 11 && value4 == 11) || (value1 == 11 && value4 == 11 && value5 == 11) || (value2 == 11 && value4 == 11 && value5 == 11) || (value1 == 11 && value3 == 11 && value5 == 11) || (value2 == 11 && value3 == 11 && value5 == 11) || (value1 == 11 && value2 == 11 && value5 == 11) || (value1 == 11 && value2 == 11 && value4 == 11))
        {
            highPair = false
            set = true
        }
            
        // pair/set queens
        if (firstDeal == true && (value1 == 12 && value2 == 12) || (value1 == 12 && value3 == 12) || (value1 == 12 && value4 == 12) || (value1 == 12 && value5 == 12) || (value2 == 12 && value3 == 12) || (value2 == 12 && value4 == 12) || (value2 == 12 && value5 == 12) || (value3 == 12 && value4 == 12) || (value3 == 12 && value5 == 12) || (value4 == 12 && value5 == 12))
        {
            pairs += 1
            highPair = true
        }
        if (firstDeal == true && (value1 == 12 && value2 == 12 && value3 == 12) || (value2 == 12 && value3 == 12 && value4 == 12) || (value3 == 12 && value4 == 12 && value5 == 12) || (value1 == 12 && value3 == 12 && value4 == 12) || (value1 == 12 && value4 == 12 && value5 == 12) || (value2 == 12 && value4 == 12 && value5 == 12) || (value1 == 12 && value3 == 12 && value5 == 12) || (value2 == 12 && value3 == 12 && value5 == 12) || (value1 == 12 && value2 == 12 && value5 == 12) || (value1 == 12 && value2 == 12 && value4 == 12))
        {
            highPair = false
            set = true
        }
            
        // pair/set kings
        if (firstDeal == true && (value1 == 13 && value2 == 13) || (value1 == 13 && value3 == 13) || (value1 == 13 && value4 == 13) || (value1 == 13 && value5 == 13) || (value2 == 13 && value3 == 13) || (value2 == 13 && value4 == 13) || (value2 == 13 && value5 == 13) || (value3 == 13 && value4 == 13) || (value3 == 13 && value5 == 13) || (value4 == 13 && value5 == 13))
        {
            pairs += 1
            highPair = true
        }
        if (firstDeal == true && (value1 == 13 && value2 == 13 && value3 == 13) || (value2 == 13 && value3 == 13 && value4 == 13) || (value3 == 13 && value4 == 13 && value5 == 13) || (value1 == 13 && value3 == 13 && value4 == 13) || (value1 == 13 && value4 == 13 && value5 == 13) || (value2 == 13 && value4 == 13 && value5 == 13) || (value1 == 13 && value3 == 13 && value5 == 13) || (value2 == 13 && value3 == 13 && value5 == 13) || (value1 == 13 && value2 == 13 && value5 == 13) || (value1 == 13 && value2 == 13 && value4 == 13))
        {
            highPair = false
            set = true
        }
            
        // pair/set aces
        if (firstDeal == true && (value1 == 1 && value2 == 1) || (value1 == 1 && value3 == 1) || (value1 == 1 && value4 == 1) || (value1 == 1 && value5 == 1) || (value2 == 1 && value3 == 1) || (value2 == 1 && value4 == 1) || (value2 == 1 && value5 == 1) || (value3 == 1 && value4 == 1) || (value3 == 1 && value5 == 1) || (value4 == 1 && value5 == 1))
        {
            pairs += 1
            highPair = true
        }
        if (firstDeal == true && (value1 == 1 && value2 == 1 && value3 == 1) || (value2 == 1 && value3 == 1 && value4 == 1) || (value3 == 1 && value4 == 1 && value5 == 1) || (value1 == 1 && value3 == 1 && value4 == 1) || (value1 == 1 && value4 == 1 && value5 == 1) || (value2 == 1 && value4 == 1 && value5 == 1) || (value1 == 1 && value3 == 1 && value5 == 1) || (value2 == 1 && value3 == 1 && value5 == 1) || (value1 == 1 && value2 == 1 && value5 == 1) || (value1 == 1 && value2 == 1 && value4 == 1))
        {
            highPair = false
            set = true
        }
        
        // MARK: Straight/Straight Flush
        
        array.append(value1)
        array.append(value2)
        array.append(value3)
        array.append(value4)
        array.append(value5)
        
        // find the highest and lowest valued elements and store in a var
        min = array.min()!
        max = array.max()!
        var aces = 0
        
        // check for straight to the ace
        for i in array
        {
            if (i == 1)
            {
                print("ace detected")
                aces += 1
            }
        }
        
        if (aces == 1)
        {
            aces = 14
            if ( (aces - min == 4) && pairs == 0)
            {
                straight = true
                pairs = 0
                set = false
                flush = false
                fourKind = false
            }
        }
        
        // regular straigh
        if ( (max - min == 4) && pairs == 0)
        {
            straight = true
            pairs = 0
            set = false
            flush = false
            fourKind = false
        }
        
        // spades
        if (suit1 == "spade" && suit2 == "spade" && suit3 == "spade" && suit4 == "spade" && suit5 == "spade" && straight == false)
        {
            flush = true
            pairs = 0
            highPair = false
            set = false
            straight = false
            fullhouse = false
            fourKind = false
        }
        // straight flush
        if (suit1 == "spade" && suit2 == "spade" && suit3 == "spade" && suit4 == "spade" && suit5 == "spade" && straight == true)
        {
            straightFlush = true
            pairs = 0
            highPair = false
            set = false
            set = false
            straight = false
            flush = false
            fullhouse = false
            fourKind = false
            royalFlush = false
        }
        // clubs
        if (suit1 == "club" && suit2 == "club" && suit3 == "club" && suit4 == "club" && suit5 == "club" && straight == false)
        {
            flush = true
            pairs = 0
            highPair = false
            set = false
            straight = false
            fullhouse = false
            fourKind = false
        }
        if (suit1 == "club" && suit2 == "club" && suit3 == "club" && suit4 == "club" && suit5 == "club" && straight == true)
        {
            straightFlush = true
            pairs = 0
            highPair = false
            set = false
            set = false
            straight = false
            flush = false
            fullhouse = false
            fourKind = false
            royalFlush = false
        }
        // diamonds
        if (suit1 == "diamond" && suit2 == "diamond" && suit3 == "diamond" && suit4 == "diamond" && suit5 == "diamond" && straight == false)
        {
            flush = true
            pairs = 0
            highPair = false
            set = false
            straight = false
            fullhouse = false
            fourKind = false
        }
        if (suit1 == "diamond" && suit2 == "diamond" && suit3 == "diamond" && suit4 == "diamond" && suit5 == "diamond" && straight == true)
        {
            straightFlush = true
            pairs = 0
            highPair = false
            set = false
            set = false
            straight = false
            flush = false
            fullhouse = false
            fourKind = false
            royalFlush = false
        }
        // hearts
        if (suit1 == "heart" && suit2 == "heart" && suit3 == "heart" && suit4 == "heart" && suit5 == "heart" && straight == false)
        {
            flush = true
            pairs = 0
            highPair = false
            set = false
            straight = false
            fullhouse = false
            fourKind = false
        }
        if (suit1 == "heart" && suit2 == "heart" && suit3 == "heart" && suit4 == "heart" && suit5 == "heart" && straight == true)
        {
            straightFlush = true
            pairs = 0
            highPair = false
            set = false
            set = false
            straight = false
            flush = false
            fullhouse = false
            fourKind = false
            royalFlush = false
        }
        
        // MARK: Full House
        if (pairs == 2 && set == true)
        {
            fullhouse = true
            pairs = 0
            lowPair = false
            highPair = false
            set = false
            straight = false
            flush = false
            fourKind = false
            royalFlush = false
        }
        
        // MARK: 4 of a Kind
        if ( ((value1 == value2) && (value1 == value3) && (value1 == value4)) || ((value2 == value3) && (value2 == value4) && (value2 == value5)) || ((value3 == value4) && (value3 == value5) && (value3 == value1)) || ((value4 == value5) && (value4 == value1) && (value4 == value2)) )
        {
            fourKind = true
            pairs = 0
            lowPair = false
            highPair = false
            set = false
            set = false
            straight = false
            flush = false
            fullhouse = false
            royalFlush = false
        }
        
        
        
        //MARK: Royal Flush
        if (straightFlush == true && aces == 1)
        {
            royalFlush = true
            straightFlush = false
        }
        
        
        
        
        // MARK: Payout & Statement Indicator
        if (firstDeal == true)
        {
            if (highPair == true && pairs == 1)
            {
                statement = "JACKS OR BETTER"
                credits += 5
                winnings += 5
                playerWonHand = true
            }
            if (pairs == 2)
            {
                statement = "TWO PAIR"
                credits += 10
                winnings += 10
                playerWonHand = true
            }
            if (set == true && fullhouse == false)
            {
                statement = "3 OF A KIND"
                credits += 15
                winnings += 15
                playerWonHand = true
            }
            if (straight == true)
            {
                statement = "STRAIGHT"
                credits += 20
                winnings += 20
                playerWonHand = true
            }
            if (flush == true)
            {
                statement = "FLUSH"
                credits += 30
                winnings += 30
                playerWonHand = true
            }
            if (fullhouse == true)
            {
                statement = "FULL HOUSE"
                credits += 45
                winnings += 45
                playerWonHand = true
            }
            if (fourKind == true)
            {
                statement = "4 OF A KIND!"
                credits += 125
                winnings += 125
                playerWonHand = true
            }
            if (straightFlush == true)
            {
                statement = "STRAIGHT FLUSH!"
                credits += 250
                winnings += 250
                playerWonHand = true
            }
            if (royalFlush == true)
            {
                statement = "ROYAL FLUSH!"
                credits += 4000
                winnings += 4000
                playerWonHand = true
            }
        }
            // reset winning hand indicator and vars
        if (firstDeal == false)
        {
            statement = ""
        }
    }
}
