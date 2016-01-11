//
//  TinySpinner.swift
//
//  Created by Hazim Judi on 2016-01-07.
//  MIT license.
//

import UIKit

class TinySpinner: UIImageView {
    
    var line = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let path = UIBezierPath(ovalInRect: CGRect(origin: CGPointZero, size: frame.size))
        
        line = CAShapeLayer()
        line.frame = CGRect(origin: CGPointZero, size: frame.size)
        line.strokeColor = UIColor.blackColor().CGColor
        line.strokeEnd = 0.8
        line.lineWidth = 2
        line.fillColor = UIColor.clearColor().CGColor
        line.path = path.CGPath
        
        self.layer.addSublayer(line)
    }
    
    var lineColor : UIColor {
        
        get {
            return UIColor(CGColor: self.line.strokeColor!)
        }
        set(color) {
            
            self.line.strokeColor = color.CGColor
        }
    }
    
    var gapPercentage : CGFloat {
        
        get {
            return self.line.strokeEnd
        }
        set(gap) {
            
            line.strokeEnd = gap
        }
    }
    
    override var alpha : CGFloat {
        
        get {
            return self.alpha
        }
        set(alpha) {
            
            if alpha > 0 {
                
                self.runSpinAnimation()
            }
            else {
                
                self.layer.removeAnimationForKey("rotationAnimation")
            }
            super.alpha = alpha
        }
    }
    
    func runSpinAnimation() {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z");
        rotationAnimation.toValue = M_PI * 2.0 * 6
        rotationAnimation.duration = 4;
        rotationAnimation.cumulative = true;
        rotationAnimation.repeatCount = HUGE
        self.layer.addAnimation(rotationAnimation, forKey:"rotationAnimation");
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
