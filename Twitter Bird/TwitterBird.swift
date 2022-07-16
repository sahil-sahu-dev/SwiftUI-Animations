//
//  TwitterBird.swift
//  
//
//  Created by Sahil Sahu on 16/07/22.
//

import Foundation

//MARK: Bird Shape

struct TwitterBird: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 120, y: 410))
        path.addCurve(to: CGPoint(x: 227, y: 348), control1: CGPoint(x: 185, y: 443), control2: CGPoint(x: 230, y: 390))
        
        path.addCurve(to: CGPoint(x: 238, y: 335), control1: CGPoint(x: 220, y: 350), control2: CGPoint(x: 230, y: 350))
        
        path.addLine(to: CGPoint(x: 220, y: 340))
        
        path.addCurve(to: CGPoint(x: 235, y: 325), control1: CGPoint(x: 230, y: 335), control2: CGPoint(x: 233, y: 330))
        
        path.addLine(to: CGPoint(x: 220, y: 332))
        
        path.addCurve(to: CGPoint(x: 179, y: 346), control1:  CGPoint(x: 210, y: 310), control2:  CGPoint(x: 180, y: 320))
        
        path.addCurve(to: CGPoint(x: 128, y: 328), control1: CGPoint(x: 130, y: 350), control2: CGPoint(x: 120, y: 310))
        
        path.move(to: CGPoint(x: 128, y: 328))
        
        path.addCurve(to: CGPoint(x: 134, y: 358), control1: CGPoint(x: 120, y: 340), control2: CGPoint(x: 120, y: 350))
        
        path.addCurve(to: CGPoint(x: 123, y: 355), control1: CGPoint(x: 128, y: 357), control2: CGPoint(x: 128, y: 357))
        
        //path.move(to: CGPoint(x: 123, y: 355))
        
        path.addCurve(to: CGPoint(x: 150, y: 383), control1: CGPoint(x: 130, y: 380), control2: CGPoint(x: 145, y: 380))
        
        path.addCurve(to: CGPoint(x: 131, y: 383), control1: CGPoint(x: 140, y: 385), control2: CGPoint(x: 140, y: 385))
        
        path.addCurve(to: CGPoint(x: 154, y: 399), control1: CGPoint(x: 142, y: 400), control2: CGPoint(x: 145, y: 397))
        
        path.addCurve(to: CGPoint(x: 120, y: 410), control1: CGPoint(x: 125, y: 414), control2: CGPoint(x: 125, y: 408))
        
        return path
    }
    
}




