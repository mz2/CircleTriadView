//
//  CircleTriadView.swift
//  CircleTriadView
//
//  Created by Matias Piipari on 13/06/2016.
//  Copyright © 2016 Matias Piipari & Co. All rights reserved.
//

import Foundation

@objc @IBDesignable public class MPCircleTriadView: NSView {
    
    @IBInspectable var shadowTint: NSColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 1)  { didSet { self.needsDisplay = true } }
    @IBInspectable var lightFillColor: NSColor = NSColor(calibratedRed: 1, green: 1, blue: 1, alpha: 1)  { didSet { self.needsDisplay = true } }
    @IBInspectable var darkFillColor: NSColor = NSColor(calibratedRed: 0.95, green: 0.95, blue: 0.95, alpha: 1) { didSet { self.needsDisplay = true } }
    @IBInspectable var inset:CGFloat = 7  { didSet { self.needsDisplay = true } }
    @IBInspectable var middleCircleInsetFraction:CGFloat = 0.725 { didSet { self.needsDisplay = true } }
    
    @IBInspectable var circleShadowOpacity:CGFloat = 0.11 { didSet { self.needsDisplay = true } }
    @IBInspectable var outerCircleShadowOpacity:CGFloat = 0.11 { didSet { self.needsDisplay = true } }
    @IBInspectable var circleShadowYOffset:CGFloat = -5 { didSet { self.needsDisplay = true } }
    @IBInspectable var outerCircleShadowYOffset:CGFloat = -3 { didSet { self.needsDisplay = true } }
    @IBInspectable var circleShadowBlurRadius:CGFloat = 12 { didSet { self.needsDisplay = true } }
    @IBInspectable var outerCircleShadowBlurRadius:CGFloat = 7 { didSet { self.needsDisplay = true } }
    
    @IBInspectable var circleFillGradient: NSGradient {
        return NSGradient(colors: [lightFillColor, self.lightFillColor.blendedColorWithFraction(0.5, ofColor: self.darkFillColor)!, self.darkFillColor], atLocations: [0.0, 0.85, 1.0], colorSpace: NSColorSpace.genericRGBColorSpace())!
    }
    
    var circleShadow: NSShadow  {
        let shadow = NSShadow()
        shadow.shadowColor = shadowTint.colorWithAlphaComponent(circleShadowOpacity * shadowTint.alphaComponent)
        shadow.shadowOffset = NSMakeSize(0, circleShadowYOffset)
        shadow.shadowBlurRadius = circleShadowBlurRadius
        
        return shadow
    }
    
    var outerCircleShadow: NSShadow  {
        let shadow = NSShadow()
        shadow.shadowColor = shadowTint.colorWithAlphaComponent(outerCircleShadowOpacity * shadowTint.alphaComponent)
        shadow.shadowOffset = NSMakeSize(0, outerCircleShadowYOffset)
        shadow.shadowBlurRadius = outerCircleShadowBlurRadius
        
        return shadow
    }
    
    public override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        CircleTriadKit.drawCircleTriad(circleFillGradient: circleFillGradient,
                                       circleShadow: circleShadow,
                                       outerCircleShadow: outerCircleShadow,
                                       inset: inset,
                                       width: self.frame.size.width,
                                       middleCircleInsetFraction: self.middleCircleInsetFraction)
    }
}