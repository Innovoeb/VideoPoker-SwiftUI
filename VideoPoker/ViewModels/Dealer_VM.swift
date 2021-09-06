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
//    @Published var slot1:String!
//    @Published var slot2:String!
//    @Published var slot3:String!
//    @Published var slot4:String!
//    @Published var slot5:String!
    
//    @Published var slot1:String?
//    @Published var slot2:String?
//    @Published var slot3:String?
//    @Published var slot4:String?
//    @Published var slot5:String?
    
    @Published var slot1 = ""
    @Published var slot2 = ""
    @Published var slot3 = ""
    @Published var slot4 = ""
    @Published var slot5 = ""
    
    
    init()
    {
        // create an instance of data service and get the data
        self.cards = DataService.getLocalData()
        slot1 = cards[9].image
        slot2 = cards[10].image
        slot3 = cards[11].image
        slot4 = cards[12].image
        slot5 = cards[0].image
    }
    
//    func newGame ()
//    {
//        slot1 = cards[9].image
//        slot2 = cards[10].image
//        slot3 = cards[11].image
//        slot4 = cards[12].image
//        slot5 = cards[0].image
//    }
    
    func checkIfRandom ()
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
        slot1 = cards.randomElement()!.image
        slot2 = cards.randomElement()!.image
        slot3 = cards.randomElement()!.image
        slot4 = cards.randomElement()!.image
        slot5 = cards.randomElement()!.image
        
        checkIfRandom()
        
        print(slot1)
        print(slot2)
        print(slot3)
        print(slot4)
        print(slot5)
    }
    
    
    // other game stuff
}
