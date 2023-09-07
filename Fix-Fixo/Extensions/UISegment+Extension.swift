//
//  UISegment+Extension.swift
//  CAMSfinserv
//
//  Created by Srinivas Katta on 08/11/21.
//

import Foundation
import UIKit

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font : UIFont(name: "NotoSans-SemiBold.ttf", size: 14) ?? UIFont.systemFont(ofSize: 14)], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ColorConstants.accentColor,NSAttributedString.Key.font : UIFont(name: "NotoSans-SemiBold.ttf", size: 14) ?? UIFont.systemFont(ofSize: 14)], for: .selected)
    }

    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 2.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = ColorConstants.accentColor
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}


class OYSegmentControl: UISegmentedControl {
  
  override func layoutSubviews(){
    super.layoutSubviews()
    
    let segmentStringSelected: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.font : UIFont(name:"NotoSans-SemiBold.ttf",size:14)!,
      NSAttributedString.Key.foregroundColor : UIColor.white
    ]
    
    let segmentStringHighlited: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.font : UIFont(name:"NotoSans-SemiBold.ttf",size:14)!,
      NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ]
    
    setTitleTextAttributes(segmentStringHighlited, for: .normal)
    setTitleTextAttributes(segmentStringSelected, for: .selected)
    setTitleTextAttributes(segmentStringHighlited, for: .highlighted)
    
    layer.masksToBounds = true
    
    if #available(iOS 13.0, *) {
        selectedSegmentTintColor = ColorConstants.accentColor
    } else {
      tintColor = ColorConstants.accentColor
    }
    
    backgroundColor = #colorLiteral(red: 0.9191747308, green: 0.9334954619, blue: 0.9506797194, alpha: 1)
    
    //corner radius
    let cornerRadius = bounds.height / 2
    let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    //background
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
      layer.borderWidth = 0.6
      layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    layer.maskedCorners = maskedCorners

    let foregroundIndex = numberOfSegments
    if subviews.indices.contains(foregroundIndex),
      let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
      foregroundImageView.image = UIImage()
      foregroundImageView.clipsToBounds = true
      foregroundImageView.layer.masksToBounds = true
      foregroundImageView.backgroundColor = ColorConstants.accentColor
      
      foregroundImageView.layer.cornerRadius = bounds.height / 2 + 5
      foregroundImageView.layer.maskedCorners = maskedCorners
    }
  }
  
  override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return false
  }
  
}
