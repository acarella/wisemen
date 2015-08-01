//
//  FirstViewController.swift
//  WiseMen
//
//  Created by antonio.carella@me.com on 7/20/14.
//  Copyright (c) 2014 antonio.carella@me.com. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var midImage: UIImageView!
    @IBOutlet var rightImage: UIImageView!
    
    var timer = NSTimer()
    var quoteTime:NSTimeInterval = 5.0
    var lastLocation = CGPoint.self.zeroPoint
    var originalPosition: CGFloat = 0.0
    let frankImage = UIImage(named: "frank-zappa_young_circle.jpg") as UIImage?
    let tomImage = UIImage(named: "tom1_circle.jpg") as UIImage?
    let wernerImage = UIImage(named: "werner-herzog2_circle.jpg") as UIImage?
    var heightFloat: Float = 0.0
    var topThirdMark: Float = 0.0
    var bottomThirdMark: Float = 0.0
    var widthFloat: Float = 0.0
    var leftThirdMark: CGFloat = 0.0
    var rightThirdMark: CGFloat = 0.0
    var correctTag: Int = -1
    var swipes: Int = 0
    var answerTag: Int = 6
    var leftIsGone: Bool = false
    var midIsGone: Bool = false
    var rightIsGone: Bool = false
    var leftImageCenter:CGPoint = CGPoint.self.zeroPoint
    var midImageCenter:CGPoint = CGPoint.self.zeroPoint
    var rightImageCenter:CGPoint = CGPoint.self.zeroPoint
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(true)
        heightFloat = Float(self.view.frame.size.height)
        topThirdMark = Float(heightFloat/3)
        bottomThirdMark = Float(topThirdMark * 2)
        widthFloat = Float(self.view.frame.size.width)
        leftThirdMark = CGFloat(widthFloat/3)
        rightThirdMark = (leftThirdMark * 2)
        
        leftImageCenter = leftImage!.center
        midImageCenter = midImage!.center
        rightImageCenter = rightImage!.center
        
        prepForGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func prepForGame(){
        
        leftImage.center = leftImageCenter
        midImage.center = midImageCenter
        rightImage.center = rightImageCenter
        
        leftImage.alpha = 0.0
        midImage.alpha = 0.0
        rightImage.alpha = 0.0
        
        quoteLabel.hidden = true
        quoteLabel.alpha = 1
        originalPosition = view.center.y
        
        quoteTime = 5.0
        let quoteAuthor = QuoteSelector().getQuote()
        // This is giving unresolved identifier error
        //let qouteLength = quoteAuthor.quote.length
        
        if(quoteAuthor.quote.length < 100){
            quoteTime -= 1.5
        }
        
        if (quoteAuthor.quote.length > 150){
            quoteTime += 2.0
        }
        
        if (quoteAuthor.quote.length > 200){
            quoteTime += 3.5
        }
        
        if (quoteAuthor.quote.length > 250){
            quoteTime += 2.5
        }
        println("Quote Length: \(quoteAuthor.quote.length)")
        quoteLabel.text = "\"" + (quoteAuthor.quote as String) + "\""
        quoteLabel.sizeToFit()
        correctTag = quoteAuthor.author
        
        swipes = 0
        answerTag = 6
        
        startGame()
    }
    
    func startGame(){
        
        quoteLabel.hidden = false
        UIView.animateWithDuration(quoteTime, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.quoteLabel.alpha = 0
            },  completion: {
                (value: Bool) in
                self.showFaces()
        })
        
    }
    
    func showFaces(){
        
        let pictureOrder = (arc4random() % 5) + 1
        
        if (pictureOrder == 1){
            
            leftImage.image = frankImage
            midImage.image = tomImage
            rightImage.image = wernerImage
            
            leftImage.tag = 1
            midImage.tag = 2
            rightImage.tag = 3
            
        } else if (pictureOrder == 2){
            
            leftImage.image = frankImage
            midImage.image = wernerImage
            rightImage.image = tomImage
            
            leftImage.tag = 1
            midImage.tag = 3
            rightImage.tag = 2
            
        } else if (pictureOrder == 3){
            
            leftImage.image = tomImage
            midImage.image = frankImage
            rightImage.image = wernerImage
            
            leftImage.tag = 2
            midImage.tag = 1
            rightImage.tag = 3
            
        } else if (pictureOrder == 4){
            
            leftImage.image = tomImage
            midImage.image = wernerImage
            rightImage.image = frankImage
            
            leftImage.tag = 2
            midImage.tag = 3
            rightImage.tag = 1
            
        }else if (pictureOrder == 5){
            
            leftImage.image = wernerImage
            midImage.image = frankImage
            rightImage.image = tomImage
            
            leftImage.tag = 3
            midImage.tag = 1
            rightImage.tag = 2
            
        }else if (pictureOrder == 6){
            
            leftImage.image = wernerImage
            midImage.image = tomImage
            rightImage.image = frankImage
            
            leftImage.tag = 3
            midImage.tag = 2
            rightImage.tag = 1
            
        } else {
            
            leftImage.image = wernerImage
            midImage.image = frankImage
            rightImage.image = tomImage
            
            leftImage.tag = 3
            midImage.tag = 1
            rightImage.tag = 2
            
        }
        
        leftImage.alpha = 1
        midImage.alpha = 1
        rightImage.alpha = 1
        
    }
    
    
    @IBAction func swipeFaceOutOfView(recognizer:UIPanGestureRecognizer) {
        
        let translation = recognizer.translationInView(self.view)
        
        recognizer.view?.center = CGPoint(x:recognizer.view!.center.x,
            y:recognizer.view!.center.y + translation.y)
        
        recognizer.setTranslation(CGPointZero, inView: self.view)
        
        if (recognizer.state == UIGestureRecognizerState.Cancelled ||
            recognizer.state == UIGestureRecognizerState.Ended ||
            recognizer.state == UIGestureRecognizerState.Failed)
        {
            
            if (recognizer.view?.center.y < CGFloat(topThirdMark)){
                
                var center = recognizer.view?.center.x
                self.animateToYPos(recognizer.view!, newYPos: 0 - (CGFloat(self.view!.superview!.bounds.height)/2), duration: 1.0)
                rearrangeRemainingFaces(recognizer.view!.tag, center: center!)
                
            } else if(recognizer.view?.center.y > CGFloat(bottomThirdMark)){
                
                var center = recognizer.view?.center.x
                
                self.animateToYPos(recognizer.view!, newYPos: self.view.bounds.height + (CGFloat(self.view.superview!.bounds.height)*2), duration: 1.0)
                rearrangeRemainingFaces(recognizer.view!.tag, center: center!)
                
            } else if (CGFloat(bottomThirdMark) > recognizer.view?.center.y && recognizer.view?.center.y > CGFloat(topThirdMark)){
                
                self.animateToYPos(recognizer.view!, newYPos: CGFloat(originalPosition), duration: 0.25)
            }
        }
    }
    
    func rearrangeRemainingFaces(tag: Int, center:CGFloat){
        
        if (swipes == 0){
            
            if(center == leftImage!.center.x) {
                
                animateToXPos(rightImage!, newXPos: leftThirdMark)
                
                animateToXPos(midImage!, newXPos: rightThirdMark)
                
                leftIsGone = true;
            }
            
            if(center == midImage!.center.x) {
                
                animateToXPos(leftImage!, newXPos: rightThirdMark)
                
                animateToXPos(rightImage!, newXPos: leftThirdMark)
                
                midIsGone = true;
            }
            
            if(center == rightImage!.center.x) {
                
                animateToXPos(leftImage!, newXPos: rightThirdMark)
                
                animateToXPos(midImage!, newXPos: leftThirdMark)
                
                rightIsGone = true;
            }
            
        } else {
            
            if ((center == leftImage!.center.x) && midIsGone){
                
                println("animateToXPos(rightImage, newXPos: rightImageCenter.x)")
                animateToXPos(rightImage!, newXPos: CGFloat(rightImageCenter.x))
                
            } else if ((center == leftImage!.center.x) && rightIsGone){
                
                println("animateToXPos(midImage, newXPos: rightImageCenter.x)")
                animateToXPos(midImage!, newXPos: CGFloat(rightImageCenter.x))
                
            }else if ((center == midImage!.center.x) && leftIsGone){
                
                println("animateToXPos(rightImage, newXPos: rightImageCenter.x)")
                animateToXPos(rightImage!, newXPos: CGFloat(rightImageCenter.x))
                
            } else if ((center == midImage!.center.x) && rightIsGone){
                
                println("animateToXPos(leftImage, newXPos: leftImageCenter.x)")
                animateToXPos(leftImage!, newXPos: CGFloat(leftImageCenter.x))
                
            } else if ((center == rightImage!.center.x) && leftIsGone){
                
                println("animateToXPos(midImage, newXPos: rightImageCenter.x)")
                animateToXPos(midImage!, newXPos: CGFloat(leftImageCenter.x))
                
            } else if ((center == rightImage!.center.x) && midIsGone){
                
                println("animateToXPos(leftImage, newXPos: leftImageCenter.x)")
                animateToXPos(leftImage!, newXPos: CGFloat(leftImageCenter.x))
                
            }
            
        }
        
        answerTag = answerTag - tag
        
        swipes++
        if (swipes > 1){
            checkAnswer(answerTag)
        }
    }
    
    func animateToXPos(theView: UIView, newXPos: CGFloat){
        
        let timeInterval: NSTimeInterval = 0.5
        
        UIView.animateWithDuration(timeInterval) {
            theView.center.x = newXPos
        }
    
    }
    
    func animateToYPos(theView: UIView, newYPos: CGFloat, duration: NSTimeInterval){
        
        UIView.animateWithDuration(duration, animations: ({ () -> Void in
            theView.center.y = newYPos
        }));
    }
    
    func checkAnswer(tag: Int){
        
        if (correctTag == tag)
        {
            score++
            println("Score: \(score)")
            let title = "You got it right!"
            let message = "You earned one point. Keep playing?"
            
            showResult(title, message: message)
            
        } else {
            let title = "You got it wrong!"
            let message = "You earned no points. Keep playing?"
            
            showResult(title, message: message)
            
        }
    }
    
    func showResult(title:NSString, message:NSString){
        var alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Yeah! Keep playing.", style: UIAlertActionStyle.Default, handler: { action in
            switch action.style{
            case .Default:
                
                self.leftImage.alpha = 1
                self.midImage.alpha = 1
                self.rightImage.alpha = 1
                
                self.prepForGame()
                break
                
            case .Cancel:
                println("cancel")
                break
                
            case .Destructive:
                println("destructive")
                break
            }
        }))
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Nope, I'm done.", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                // saveScore()
                //endGame()
                println("default")
                break
                
            case .Cancel:
                println("cancel")
                break
                
            case .Destructive:
                println("destructive")
                break
            }
        }))
    }
    
}