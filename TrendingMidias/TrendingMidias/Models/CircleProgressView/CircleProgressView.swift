//
//  CircleProgressView.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import UIKit

class CircleProgressView: UIView {
    var progressLyr = CAShapeLayer() // instancia as layers
    var trackLyr = CAShapeLayer() //

    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       makeCircularPath()
    }
    
    var progressClr = UIColor.white {
       didSet {
          progressLyr.strokeColor = progressClr.cgColor
       }
    }
    var trackClr = UIColor.white {
       didSet {
          trackLyr.strokeColor = trackClr.cgColor
       }
    }
    
    func makeCircularPath() {
       self.backgroundColor = UIColor.clear
        self.progressClr = .yellow // cor progresso
        self.trackClr = .black // cor restante
       self.layer.cornerRadius = self.frame.size.width/2
       let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        
       trackLyr.path = circlePath.cgPath
       trackLyr.fillColor = UIColor.clear.cgColor // cor de preenchimento
       trackLyr.strokeColor = trackClr.cgColor
       trackLyr.lineWidth = 2.0 // grossura da linha
       trackLyr.strokeEnd = 1.0
        
       layer.addSublayer(trackLyr)
       progressLyr.path = circlePath.cgPath
       progressLyr.fillColor = UIColor.clear.cgColor
       progressLyr.strokeColor = progressClr.cgColor
       progressLyr.lineWidth = 5.0 // grossura da linha
       progressLyr.strokeEnd = 0.0
       layer.addSublayer(progressLyr)
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
       let animation = CABasicAnimation(keyPath: "strokeEnd")
       animation.duration = duration
       animation.fromValue = 0
       animation.toValue = value
    
       //let animationColor = CABasicAnimation(keyPath: "strokeEnd")
       //animationColor.duration = duration
        
       //animationColor.fromValue = progressClr
       //animationColor.toValue = UIColor.black

       animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
       //animationColor.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        
       
       progressLyr.strokeEnd = CGFloat(value)
      // progressLyr.add(animationColor, forKey: "animatecolorprogress")
       progressLyr.add(animation, forKey: "animateprogress")
    }
}
