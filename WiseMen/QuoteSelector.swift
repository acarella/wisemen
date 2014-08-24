//
//  QuoteSelector.swift
//  WiseMen
//
//  Created by antonio.carella@me.com on 7/25/14.
//  Copyright (c) 2014 antonio.carella@me.com. All rights reserved.
//

import Foundation

class QuoteSelector {
    
    func getQuote() -> (quote: NSString, author: Int) {
        
        let authorChoice = (UInt(arc4random_uniform(3) + 1))
        
        println("Author choice: \(authorChoice)")
        
        if (authorChoice == 1) {
            
            let length = UInt32(frankQuotes.count)
            let quoteChoice = arc4random_uniform(length)
            return (frankQuotes[Int(quoteChoice)], 1)
            
        } else if (authorChoice == 2){
            
            let length = UInt32(tomQuotes.count)
            let quoteChoice = arc4random_uniform(length)
            return (tomQuotes[Int(quoteChoice)], 2)
            
        } else {
            
            let length = UInt32(wernerQuotes.count)
            let quoteChoice = arc4random_uniform(length)
            return (wernerQuotes[Int(quoteChoice)], 3)
            
        }
        
    }
    
}