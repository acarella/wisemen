// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)
random = arc4random_uniform(3)

    
    let frankQuotes = ["So many books, so little time.", "Without deviation from the norm, progress is not possible.", "If you end up with a boring miserable life because you listened to your mom, your dad, your teacher, your priest, or some guy on television telling you how to do your shit, then you deserve it.", "If you want to get laid, go to college. If you want an education, go to the library.", "A mind is like a parachute. It doesn't work if it is not open.", "Jazz isn't dead. It just smells funny."]
    
    let tomQuotes = ["Well, for a brief time, I think everybody’s lived in a car.", "I live at Bedlam and Squalor. It’s that way.", "I'm better off here in the sticks where I can't hurt myself.", "Kansas is a good place to dream. You wake up in the morning, look out the window and don't see anything, you make it all up.", "I'd have a porch, a mean dog and a 12-gauge shotgun. You wouldn't throw your baseball into my yard buddy, you'd never see it again.",  "If you get far enough away you'll be on your way back home.", "It’s like a big ship and the water’s on fire (on New York City).", "I came here for the shoes, it's a real good town for shoes. (on New York City)", "I was born in the back seat of a Yellow Cab in a hospital loading zone and with the meter still running. I emerged needing a shave and shouted 'Times Square, and step on it!'", "Looks better in the rain, like it's been lacquered. (on New York City)", "After a rain in New York all the dogs that got caught in the rain, somehow the water washed away their whole trail and they can't get back home so about 4 in the morning you see all these stranded dogs on the street and they're looking around like - won't you help me get back home, sir, please - excuse me sir - excuse me sir - can you help me find my way back home - all makes and models, the short ones, the black ones, the tall ones, the expensive ones, the long ones, the disturbed ones, they all want to get home.", "I don't know where I'm living... I've uprooted a lot. It's like being a traveling salesman...There's a certain gypsy quality, and I'm used to it.", "I find it easy to write under difficult circumstances and I can capture what's going on. I'm moving towards needing a compound though. An estate. But in the meantime I'm operating out of a storefront here in the Los Angeles area.", "Nothing beats the drama of a bullhorn.", "I opened for Frank Zappa, for John Prine, Martha and the Vandellas, Sonny Terry and Brownie McGhee. I even opened for Buffalo Bob. Got to take it where you find it.", "You know, I don’t like straight lines. The problem is that most instruments are square and music is always round.", "Everything is a potential instrument, it depends on how you use it. I remember I was doing Swordfishtrombones and somebody took a stool -- a metal stool -- and started dragging it across the studio floor to move it out of the way. It sounded like bus brakes on a big city bus. So I like things that fall outside of the spectrum of what we consider traditional instruments and acceptable sound.", "I love all that. I have a guitar made out of a 2x4 that I bought in Cleveland. You know, in Iraq, you can't have a guitar in the window of a music store because it's too sexy. You know, the curves. So I could go over there with these 2x4 guitars and really take the country by storm.", "It's hard to play with a bagpipe player. You can't play with them. It's like an exotic bird. I love the sound, it's like strangling a goose.", "If you record the sound of bacon in a frying pan and play it back it sounds like the pops and cracks on an old 33 1/3 recording. Almost exactly like that. You could substitute it for that sound."]
    
    let wernerQuotes = ["What would an ocean be without a monster lurking in the dark?  It would be like sleep without dreams.", "Do you not then hear this horrible scream all around you that people usually call silence.", "Academia is the death of cinema.  It is the very opposite of passion.  Film is not the art of scholars, but of illiterates.", "Look into the eyes of a chicken and you will see real stupidity. It is a kind of bottomless stupidity, a fiendish stupidity. They are the most horrifying, cannibalistic and nightmarish creatures in the world.", "Facts do not convey truth. That's a mistake. Facts create norms, but truth creates illumination.", "If you truly love film, I think the healthiest thing to do is not read books on the subject. I prefer the glossy film magazines with their big color photos and gossip columns, or the National Enquirer. Such vulgarity is healthy and safe.", "In the face of the obscene, explicit malice of the jungle, which lacks only dinosaurs as punctuation, I feel like a half-finished, poorly expressed sentence in a cheap novel.", "People think we had a love-hate relationship. Well, I did not love him, nor did I hate him. We had mutual respect for each other, even as we both planned each other's murder."]
    
            let authorChoice = (UInt(arc4random_uniform(3) + 1))

        if (authorChoice == 1) {
            
            let length = UInt32(frankQuotes.count)
            let quoteChoice = arc4random_uniform(length)
            return (frankQuotes[Int(quoteChoice)], 1)
            
        } else if (authorChoice == 2){
            
            let length = UInt32(frankQuotes.count)
            let quoteChoice = arc4random_uniform(length)
            return (tomQuotes[Int(quoteChoice)], 2)
            
        } else {
            
            let length = UInt32(frankQuotes.count)
            let quoteChoice = arc4random_uniform(length)
            return (wernerQuotes[Int(quoteChoice)], 3)
}



