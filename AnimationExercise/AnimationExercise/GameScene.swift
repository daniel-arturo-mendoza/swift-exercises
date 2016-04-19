//
//  GameScene.swift
//  AnimationExercise
//
//  Created by Daniel Mendoza on 17/04/2016.
//  Copyright (c) 2016 Daniel Mendoza. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    var bear : SKSpriteNode!
    var bearWalkingFrames : [SKTexture]!
    var movingAnimation : SKAction?
 
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = (UIColor.blackColor())
        
        setupAnimation()
        
        //walkingBear()
        //bear?.runAction(movingAnimation!)
    }
    
    
    func setupAnimation() {
        let bearAnimatedAtlas = SKTextureAtlas(named: "BearImages")
        var walkFrames = [SKTexture]()
        
        let numImages = bearAnimatedAtlas.textureNames.count
        
        for var i=1; i<=numImages/2; i++ {
            let bearTextureName = "bear\(i)@2x~ipad.png"
            walkFrames.append(bearAnimatedAtlas.textureNamed(bearTextureName))
        }
        
        bear = SKSpriteNode(texture: walkFrames[0])
        bear.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        bearWalkingFrames = walkFrames
        
        addChild(bear)
        
        //This is our general runAction method to make our bear walk.
        let animation = SKAction.animateWithTextures(bearWalkingFrames, timePerFrame: 0.1, resize: false, restore: true)
        movingAnimation = SKAction.repeatAction(animation, count: 5)

    }
    
    
    /*func walkingBear() {
        //This is our general runAction method to make our bear walk.
        bear.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(bearWalkingFrames,
                timePerFrame: 0.1,
                resize: false,
                restore: true)),
            withKey:"walkingInPlaceBear")
    }*/
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
