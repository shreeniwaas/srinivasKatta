//
//  UIView+Extension.swift
//  CAMSfinserv
//
//  Created by Srinivas Katta on 14/10/21.
//

import Foundation
import UIKit

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
class TopConrnerView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners([.topLeft, .topRight], radius: 20)
    }
}
class BottomConrnerView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners([.bottomLeft, .bottomRight], radius: 24)
    }
}

@IBDesignable
class PlainHorizontalProgressBar: UIView {
    @IBInspectable var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

   
    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        layer.addSublayer(progressLayer)
        
    }

    override func draw(_ rect: CGRect) {
        
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = backgroundMask

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))

        progressLayer.frame = progressRect
        progressLayer.backgroundColor = color.cgColor
        progressLayer.masksToBounds = true
    }
}




extension UIView {

    func  addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1

        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true

    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}


extension UIView {
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset / 2, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        self.layer.mask = maskLayer
    }

   

}

var vSpinner : [UIView] = []

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
//        spinnerView.backgroundColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.9)
        let ai = UIActivityIndicatorView.init(style: .medium)
        ai.startAnimating()
        ai.center = spinnerView.center
        ai.color = ColorConstants.accentColor
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner.append(spinnerView)
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner.popLast()?.removeFromSuperview()
        }
    }
}

import UIKit
import CoreGraphics
import QuartzCore

class CustomLoader: UIView
{
    //MARK:- NOT ACCESSABLE OUT SIDE

    fileprivate var duration : CFTimeInterval! = 1
    fileprivate var isAnimating :Bool = false
    fileprivate var backgroundView : UIView!

    //MARK:- ACCESS INSTANCE ONLY AND CHANGE ACCORDING TO YOUR NEEDS   *******
    let colors : [UIColor] = [.red,  .blue,  .orange, .purple]
    var defaultColor : UIColor = UIColor.red
    var isUsrInteractionEnable : Bool = false
    var defaultbgColor: UIColor = UIColor.white
    var loaderSize : CGFloat = 80.0
    /// **************** ******************  ////////// **************

    //MARK:- MAKE SHARED INSTANCE
    private static var Instance : CustomLoader!
    static let sharedInstance : CustomLoader = {

        if Instance == nil
        {
            Instance = CustomLoader()
        }

        return Instance
    }()

    //MARK:- DESTROY TO SHARED INSTANCE
    @objc fileprivate func destroyShardInstance()
    {
        CustomLoader.Instance = nil
    }

    //MARK:- SET YOUR LOADER INITIALIZER FRAME ELSE DEFAULT IS CENTER
    func startAnimation()
    {
        let win = UIApplication.shared.keyWindow

        backgroundView = UIView()
        backgroundView.frame = (UIApplication.shared.keyWindow?.frame)!
        backgroundView.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
        win?.addSubview(backgroundView)

        self.frame = CGRect.init(x: ((UIScreen.main.bounds.width) - loaderSize)/2, y: ((UIScreen.main.bounds.height) - loaderSize)/2, width: loaderSize, height: loaderSize)

        self.addCenterImage()
        self.isHidden = false
        self.backgroundView.addSubview(self)

        self.layer.cornerRadius = loaderSize/2
        self.layer.masksToBounds = true
        backgroundView.accessibilityIdentifier = "CustomLoader"

        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NSExtensionHostDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CustomLoader.ResumeLoader), name: NSNotification.Name.NSExtensionHostDidBecomeActive, object: nil)

        self.layoutSubviews()
    }

    //MARK:- AVOID STUCKING LOADER WHEN CAME BACK FROM BACKGROUND
    @objc fileprivate func ResumeLoader()
    {
        if isAnimating
        {
            self.stopAnimation()
            self.AnimationStart()
        }
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        self.backgroundColor = defaultbgColor
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = isUsrInteractionEnable
        self.AnimationStart()
    }

    @objc fileprivate func addCenterImage()
    {
        /// add image in center
        let centerImage = UIImage(named: "Login Page Picture")
        let imageSize = loaderSize/2.5

        let centerImgView = UIImageView(image: centerImage)
        centerImgView.frame = CGRect(
            x: (self.bounds.width - imageSize) / 2 ,
            y: (self.bounds.height - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )

        centerImgView.contentMode = .scaleAspectFit
        centerImgView.layer.cornerRadius = imageSize/2
        centerImgView.clipsToBounds = true
        self.addSubview(centerImgView)

    }


    //MARK:- CALL IT TO START THE LOADER , AFTER INITIALIZE THE LOADER
    @objc fileprivate func AnimationStart()
    {
        if isAnimating
        {
            return
        }

        let size = CGSize.init(width: loaderSize , height: loaderSize)

        let dotNum: CGFloat = 10
        let diameter: CGFloat = size.width / 5.5   //10

        let dot = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2 + diameter * 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter/1.3,
            height: diameter/1.3
        )

        dot.backgroundColor = colors[0].cgColor
        dot.cornerRadius = frame.width / 2
        dot.frame = frame

        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceDelay = 0.1

        let angle = (2.0 * M_PI) / Double(replicatorLayer.instanceCount)

        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)

        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(dot)

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.4
        scaleAnimation.duration = 0.5
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        dot.add(scaleAnimation, forKey: "scaleAnimation")

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = -2.0 * Double.pi
        rotationAnimation.duration = 6.0
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        replicatorLayer.add(rotationAnimation, forKey: "rotationAnimation")

        if colors.count > 1 {

            var cgColors : [CGColor] = []
            for color in colors {
                cgColors.append(color.cgColor)
            }

            let colorAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
            colorAnimation.values = cgColors
            colorAnimation.duration = 2
            colorAnimation.repeatCount = .infinity
            colorAnimation.autoreverses = true
            dot.add(colorAnimation, forKey: "colorAnimation")

        }

        self.isAnimating = true
        self.isHidden = false

    }


    //MARK:- CALL IT TO STOP THE LOADER
    func stopAnimation()
    {
        if !isAnimating
        {
            return
        }
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
        let winSubviews = UIApplication.shared.keyWindow?.subviews
        if (winSubviews?.count)! > 0
        {
            for viw in winSubviews!
            {
                if viw.accessibilityIdentifier == "CustomLoader"
                {
                    viw.removeFromSuperview()
                    //  break
                }
            }
        }

        layer.sublayers = nil

        isAnimating = false
        self.isHidden = true

        self.destroyShardInstance()
    }
    //MARK:- GETTING RANDOM COLOR , AND MANAGE YOUR OWN COLORS
    @objc fileprivate func randomColor()->UIColor
    {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    override func draw(_ rect: CGRect)
    {
    }
}



@IBDesignable
class RotatingCircularGradientProgressBar: UIView {
    @IBInspectable var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var gradientColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var ringWidth: CGFloat = 5

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

    private var progressLayer = CAShapeLayer()
    private var backgroundMask = CAShapeLayer()
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        createAnimation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
        createAnimation()
    }

    private func setupLayers() {
        backgroundMask.lineWidth = ringWidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor.black.cgColor
        layer.mask = backgroundMask

        progressLayer.lineWidth = ringWidth
        progressLayer.fillColor = nil

        layer.addSublayer(gradientLayer)

        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.35, 0.5, 0.65]
    }

    private func createAnimation() {
        // MARK: Rotation Animation

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")

        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(2.5 * Double.pi)
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.duration = 4

        gradientLayer.add(rotationAnimation, forKey: "rotationAnimation")


        // MARK: Gradient Animation
        let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
        startPointAnimation.values = [CGPoint.zero, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)]

        startPointAnimation.repeatCount = Float.infinity
        startPointAnimation.duration = 1

        let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
        endPointAnimation.values = [CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint.zero]
        
        endPointAnimation.repeatCount = Float.infinity
        endPointAnimation.duration = 1

        gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
        gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
    }

    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
        backgroundMask.path = circlePath.cgPath

        progressLayer.path = circlePath.cgPath
        progressLayer.lineCap = .round
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = UIColor.black.cgColor

        gradientLayer.frame = rect
        gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
    }
}

@IBDesignable
class DashedLineView : UIView {
    @IBInspectable var perDashLength: CGFloat = 2.0
    @IBInspectable var spaceBetweenDash: CGFloat = 2.0
    @IBInspectable var dashColor: UIColor = UIColor.lightGray


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let  path = UIBezierPath()
        if height > width {
            let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            path.move(to: p0)

            let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
            path.addLine(to: p1)
            path.lineWidth = width

        } else {
            let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            path.move(to: p0)

            let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
            path.addLine(to: p1)
            path.lineWidth = height
        }

        let  dashes: [ CGFloat ] = [ perDashLength, spaceBetweenDash ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)

        path.lineCapStyle = .butt
        dashColor.set()
        path.stroke()
    }

    private var width : CGFloat {
        return self.bounds.width
    }

    private var height : CGFloat {
        return self.bounds.height
    }
}
