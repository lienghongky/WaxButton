//
//  WaxButton.swift
//  WaxButton
//
//  Created by I Mac on 4/10/18.
//  Copyright © 2018 I Mac. All rights reserved.
//

import UIKit

class WaxButton: UIButton {
    private var preferBackgroundColor:UIColor!
    @IBInspectable public var HighlightedBackgroundColor:UIColor = UIColor.clear
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = self.frame.size.height/2
        

        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        preferBackgroundColor = self.backgroundColor
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.backgroundColor = self.HighlightedBackgroundColor
        }) { (status) in
            self.startAnimating()
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.backgroundColor = self.preferBackgroundColor
        }) { (status) in
            
        }
    }
    public func startAnimating(){
        let shapeLayer = CAShapeLayer()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            let center = self.center
           self.frame.size.width = self.frame.size.height
            self.center = center
            let circularPath = UIBezierPath(arcCenter: self.center, radius: self.frame.width, startAngle: 0, endAngle:1 * CGFloat.pi, clockwise: true)
            shapeLayer.path = circularPath.cgPath
            shapeLayer.strokeColor = UIColor.blue.cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.strokeStart=0
            shapeLayer.strokeEnd = 0
            self.layer.addSublayer(shapeLayer)
            shapeLayer.frame.origin = self.frame.origin
            
            
            
        }) { (status) in
            
        }
    }
    
}
