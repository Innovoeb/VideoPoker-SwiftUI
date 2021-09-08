//
//  DataService.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import Foundation

class DataService: Decodable
{
    // static keyword = create a typed (static) method // get a method without creating an instance of the class
    static func getLocalData() -> [Card]
    {
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "cards", ofType: "json")
        
        // guard statement
        // check if pathstring is not nill, otherwise...
        guard pathString != nil else
        {
            return [Card]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
            
        // error handling
        do
        {
            // create a data object with data at the url
            let data = try Data(contentsOf: url)
                
            // decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do
            {
                // decode the json data into instances of Card
                let cardData = try
                    decoder.decode([Card].self, from: data)
                
                // set unique IDs for each instance
                for i in 0..<cardData.count
                {
                    //set unique ID
                    cardData[i].id = UUID()
                }
                
                // return the pizza data because getLocalData() expects a return of Cards
                return cardData
            }
            catch
            {
                // couldn't decode json
                print(error)
            }
        }
        catch
        {
            // if an error is thrown
            // handle the error
            print(error)
        }
    // return the card deck because getLocalData() expects a return of Cards
    return [Card]()
    }
}
