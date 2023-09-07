 //
//  CardView.swift
//
//  Created by Macbook on 15/10/20.
//  Copyright © 2020 Macbook. All rights reserved.
//


import Foundation
import UIKit
@IBDesignable
class CornerStackView: UIStackView{
    @IBInspectable
    override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    override var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
            
        }
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}
@IBDesignable
class CornerImage: UIImageView{
    @IBInspectable
    override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    override var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
            
        }
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}

@IBDesignable
class CornerButton: UIButton{
    @IBInspectable
    override var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
        
    }
    
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    override var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    override var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    override var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
//    @IBInspectable
//        var shadowColor: UIColor? {
//            get {
//                if let color = layer.shadowColor {
//                    return UIColor(cgColor: color)
//                }
//                return nil
//            }
//            set {
//                if let color = newValue {
//                    layer.shadowColor = color.cgColor
//                } else {
//                    layer.shadowColor = nil
//                }
//            }
//        }
}

 
 @IBDesignable class CornerTextField: UITextField{

    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
     @IBInspectable override var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            self.clipsToBounds = true
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
     override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
        
    }
    
    @IBInspectable
     override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
 }
 
 
 
@IBDesignable class CornerLabel: UILabel{
    override func layoutSubviews() {
        self.clipsToBounds = true
    }
    @IBInspectable override var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}

@IBDesignable
class CardView: UIView {
       @IBInspectable
    override var cornerRadius: CGFloat {
           get {
               return layer.cornerRadius
           }
           set {
               layer.cornerRadius = newValue
           }
       }

       @IBInspectable
    override var borderWidth: CGFloat {
           get {
               return layer.borderWidth
           }
           set {
               layer.borderWidth = newValue
           }
       }
       
       @IBInspectable
    override var borderColor: UIColor? {
           get {
               if let color = layer.borderColor {
                   return UIColor(cgColor: color)
               }
               return nil
           }
           set {
               if let color = newValue {
                   layer.borderColor = color.cgColor
               } else {
                   layer.borderColor = nil
               }
           }
       }
       
       @IBInspectable
    override var shadowRadius: CGFloat {
           get {
               return layer.shadowRadius
           }
           set {
               layer.shadowRadius = newValue
           }
       }
       
       @IBInspectable
    override var shadowOpacity: Float {
           get {
               return layer.shadowOpacity
           }
           set {
               layer.shadowOpacity = newValue
           }
       }
       
       @IBInspectable
    override var shadowOffset: CGSize {
           get {
               return layer.shadowOffset
           }
           set {
               layer.shadowOffset = newValue
           }
       }
       
//       @IBInspectable
//       var shadowColor: UIColor? {
//           get {
//               if let color = layer.shadowColor {
//                   return UIColor(cgColor: color)
//               }
//               return nil
//           }
//           set {
//               if let color = newValue {
//                   layer.shadowColor = color.cgColor
//               } else {
//                   layer.shadowColor = nil
//               }
//           }
//       }
    
    @IBInspectable var shadowBlurr: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2.0
        }
    }

    @IBInspectable var shadowSpread: CGFloat = 0 {
        didSet {
            if shadowSpread == 0 {
                layer.shadowPath = nil
            } else {
                let dx = -shadowSpread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                layer.shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
    }
}


 class DashedView: UIView {
    @IBInspectable
     override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

     @IBInspectable var cornerRadiusss: CGFloat = 0 {
         didSet {
             layer.cornerRadius = cornerRadiusss
             layer.masksToBounds = cornerRadiusss > 0
         }
     }
     @IBInspectable var dashWidth: CGFloat = 0
     @IBInspectable var dashColor: UIColor = .clear
     @IBInspectable var dashLength: CGFloat = 0
     @IBInspectable var betweenDashesSpace: CGFloat = 0

     var dashBorder: CAShapeLayer?

     override func layoutSubviews() {
         super.layoutSubviews()
         dashBorder?.removeFromSuperlayer()
         let dashBorder = CAShapeLayer()
         dashBorder.lineWidth = dashWidth
         dashBorder.strokeColor = dashColor.cgColor
         dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
         dashBorder.frame = bounds
         dashBorder.fillColor = nil
         if cornerRadius > 0 {
             dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
         } else {
             dashBorder.path = UIBezierPath(rect: bounds).cgPath
         }
         layer.addSublayer(dashBorder)
         self.dashBorder = dashBorder
     }
 }

 class AnimationView: UIView {
     enum Direction: Int {
         case FromLeft = 0
         case FromRight = 1
     }

     @IBInspectable var direction : Int = 0
     @IBInspectable var delay :Double = 0.0
     @IBInspectable var duration :Double = 0.0
     override func layoutSubviews() {
         initialSetup()
         UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
             if let superview = self.superview {
                            if self.direction == Direction.FromLeft.rawValue {
                                self.center.x += superview.bounds.width
                            } else {
                                self.center.x -= superview.bounds.width
                            }
                        }
         })
     }
     func initialSetup() {
         if let superview = self.superview {
             if direction == Direction.FromLeft.rawValue {
              self.center.x -= superview.bounds.width
             } else {
                 self.center.x += superview.bounds.width
             }

         }
     }
 }

 

 

