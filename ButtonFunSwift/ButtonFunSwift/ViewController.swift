//
//  ViewController.swift
//  ButtonFunSwift
//
//  Created by Matthew S. Hill on 5/19/15.
//  Copyright (c) 2015 Matthew S. Hill. All rights reserved.
//

import UIKit

var sizeOfSquare = 40
var cols = Int(UIScreen.mainScreen().bounds.width / CGFloat(sizeOfSquare))
var rows = Int(UIScreen.mainScreen().bounds.height / CGFloat(sizeOfSquare))

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUI(){
        var y : Int
        var x : Int
        
        for y = 0; y <= rows; ++y {
            for x = 0; x <= cols; ++x{
                makeSqaureWithXandY(x, y: y)
            }
        }
    }
    
    func makeSqaureWithXandY(x : Int, y : Int){
        let rect = CGRect(x: x * sizeOfSquare, y: y * sizeOfSquare, width: sizeOfSquare, height: sizeOfSquare)
        var i : UIImageView = UIImageView(frame: rect)
        i.backgroundColor = self.getRandomColor()
        self.view.addSubview(i)
    }

    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        //var square : UIImageView
        for view in self.view.subviews as! [UIView] {
            for touch : AnyObject in touches {
                if let square = view as? UIImageView {
                    if CGRectContainsPoint(square.frame, touch.locationInView(self.view)){
                        square.backgroundColor = self.getRandomColor()
                        break;
                    }//if
                }
            }//for
        }//for
    }//touchesEnded

}

