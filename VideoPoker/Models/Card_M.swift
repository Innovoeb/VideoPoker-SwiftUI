//
//  Card_M.swift
//  VideoPoker
//
//  Created by Beovonni on 9/5/21.
//

import Foundation

class Card: Identifiable, Decodable
{
    var id:UUID?
    var name:String
    var suit:String
    var value:Int
    var image:String
}
