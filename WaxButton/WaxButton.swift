//
//  WaxButton.swift
//  WaxButton
//
//  Created by Lieng Hongky on 4/10/18.
//  Copyright © 2018 Lieng Hongky. All rights reserved.
//

import UIKit
class WaxButton: UIButton {
    private var preferBackgroundColor:UIColor!
    private var preferWidth:CGFloat!
    private var centerOrigin:CGPoint!
    private var shapeLayer = CAShapeLayer()
    public var percentageLabel = UILabel()
    @IBInspectable public var isRemoveLineOnCompletion:Bool=false
    @IBInspectable public var lineWidth:CGFloat = 3{
        didSet{
            shapeLayer.lineWidth = lineWidth
        }
    }
    @IBInspectable public var lineColor:UIColor = UIColor.red{
        didSet{
            shapeLayer.strokeColor = lineColor.cgColor
        }
    }
    @IBInspectable public var EndValue:CGFloat = 0.2{
        didSet{
            if EndValue > 1{
                EndValue = 1
            }else if EndValue<0{
                EndValue = 0
            }
            
            percentageLabel.text = "\(Int(EndValue*100))%"
            shapeLayer.strokeEnd = EndValue
            if EndValue >= 1{
                idetitify()
            }
        }
    }
    @IBInspectable public var StartValue:CGFloat = -CGFloat.pi/2
    @IBInspectable public var HighlightedBackgroundColor:UIColor = UIColor.clear
    @IBInspectable public var Isclockwise:Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = self.frame.size.height/2
        preferWidth = self.frame.width
        preferBackgroundColor = self.backgroundColor
        self.centerOrigin = center
         self.addSubview(self.percentageLabel)
      
     
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        
        self.centerOrigin = self.center
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
           self.frame.size.width = self.frame.size.height
           self.center = self.centerOrigin
        }) { (status) in
            if status {
               
            let centerPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
               self.percentageLabel = UILabel(frame:self.frame)
                self.percentageLabel.center = centerPoint
                self.percentageLabel.textColor = UIColor.white
                self.percentageLabel.textAlignment = .center
               
            let circularPath = UIBezierPath(arcCenter: centerPoint, radius: self.frame.height/2, startAngle: self.StartValue, endAngle:(1 * CGFloat.pi)+CGFloat.pi/2, clockwise: self.Isclockwise)
            self.shapeLayer.path = circularPath.cgPath
            self.shapeLayer.fillColor = UIColor.clear.cgColor
            self.shapeLayer.lineCap = kCALineCapRound
            self.shapeLayer.strokeStart = 0
            self.shapeLayer.strokeEnd = self.EndValue
            self.layer.insertSublayer(self.shapeLayer, at: 0)
            CATransaction.begin()
//            let basicAnimate = CABasicAnimation(keyPath: "strokeEnd")
//            //basicAnimate.toValue = 1
//            basicAnimate.duration = 0.1
//            basicAnimate.fillMode = kCAFillModeForwards
//            basicAnimate.isRemovedOnCompletion = false
            CATransaction.setCompletionBlock({
                
                
                
            })
//            self.shapeLayer.add(basicAnimate, forKey: "animatedStroke")
            CATransaction.commit()
        }
    }
    }
    
    func idetitify()  {
        if self.isRemoveLineOnCompletion{
            UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseOut, animations: {
                self.frame.size.width = self.preferWidth
                self.center = self.centerOrigin
                self.shapeLayer.removeFromSuperlayer()
            }){(status) in
                
                
            }
        }

    }
    
}
