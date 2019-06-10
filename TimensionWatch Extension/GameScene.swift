//
//  GameScene.swift
//  TimensionWatch Extension
//
//  Created by Victor Hugo Telles on 09/06/19.
//  Copyright © 2019 Victor Hugo Telles. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var hourHand: SKSpriteNode = SKSpriteNode()
    var minuteHand: SKSpriteNode = SKSpriteNode()
    var secondHand: SKSpriteNode = SKSpriteNode()
    
    override func sceneDidLoad() {
        if let minHand:SKSpriteNode = self.childNode(withName: "MinuteHand") as? SKSpriteNode,
           let secHand:SKSpriteNode = self.childNode(withName: "SecondHand") as? SKSpriteNode,
           let hHand:SKSpriteNode = self.childNode(withName: "HourHand") as? SKSpriteNode {
            minuteHand = minHand
            secondHand = secHand
            hourHand = hHand
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        
        let hoursAngle = -1 * deg2rad(hour * 30 + minutes/2)
        let minutesAngle = -1 * deg2rad(minutes * 6)
        let secondsAngle = -1 * deg2rad(seconds * 6)
        
        hourHand.run(.rotate(toAngle: hoursAngle, duration: 0.95, shortestUnitArc: true))
        minuteHand.run(.rotate(toAngle: minutesAngle, duration: 0.95, shortestUnitArc: true))
        secondHand.run(.rotate(toAngle: secondsAngle, duration: 0.95, shortestUnitArc: true))
    }
    
    func deg2rad(_ number: CGFloat) -> CGFloat {
        return number * .pi / 180
    }
}
