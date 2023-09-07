//
//  Toast.swift
//  CAMSfinserv
//
//  Created by Macbook  on 26/10/21.
//

import Foundation
import UIKit


class ActivitySpinner: NSObject{
    static var shared: ActivitySpinner{
        let instance = ActivitySpinner()
        return instance
    }
    
    func showSpinner(controller: UIViewController){
        let main = UIView(frame: CGRect())
        main.backgroundColor = .clear
    let container = CardView(frame: CGRect())
    container.cornerRadius = 4
    container.clipsToBounds = true
    container.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
        let progress =  RotatingCircularGradientProgressBar(frame: CGRect())
        progress.clipsToBounds = true
        progress.progress = 70.0
        progress.color = ColorConstants.accentColor
        
        let label = UILabel(frame: CGRect())
        label.textAlignment = .center;
        //toastLabel.font.withSize(12.0)
        label.font = UIFont(name:"NotoSans-Bold",size:14)!
        label.text = "Please Wait..."
        label.textColor = ColorConstants.accentColor
        label.clipsToBounds  =  true
        
        container.addSubview(progress)
        container.addSubview(label)
        main.addSubview(container)
        controller.view.addSubview(main)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        progress.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        main.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            main.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 0),
            main.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: 0),
            main.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 0),
            main.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: 0),
            container.heightAnchor.constraint(equalToConstant: 100),
            container.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1),
            container.centerXAnchor.constraint(equalTo: main.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: main.centerYAnchor),
            progress.topAnchor.constraint(equalTo: container.topAnchor, constant: 2),
            progress.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            progress.heightAnchor.constraint(equalToConstant: 60),
            progress.widthAnchor.constraint(equalTo: progress.heightAnchor, multiplier: 1),
            label.topAnchor.constraint(equalTo: progress.bottomAnchor,constant: 2),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 2),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            label.heightAnchor.constraint(equalToConstant: 32)
            ])
        vSpinner.append(main)
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner.popLast()?.removeFromSuperview()
        }
    }
}
class Toast: NSObject {
    
    static var shared: Toast{
        let instance = Toast()
        return instance
    }
    func show(message: String, controller: UIViewController, isSuccess: Bool = false) {
        
        let toastContainer = GradientView(frame: CGRect())
        
        
        toastContainer.secondColor = ColorConstants.transperentSecondCoolor
        toastContainer.backgroundColor = UIColor.orange.withAlphaComponent(0.7)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 24;
        toastContainer.clipsToBounds  =  true
        
        let image = UIImageView(frame: CGRect())
        image.image = UIImage(named: "incorrect")
        if isSuccess{
            toastContainer.firstColor = ColorConstants.greenColor
            image.image = UIImage(named: "Group 1043")
        }else{
            toastContainer.firstColor = ColorConstants.transperentFirstColor
            image.image = UIImage(named: "incorrect")
        }
        image.tintColor = .white
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textAlignment = .left;
        //toastLabel.font.withSize(12.0)
        toastLabel.numberOfLines = 0
        toastLabel.font = UIFont(name:"Gilroy-Bold",size:14)!
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
       // toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        toastContainer.addSubview(image)
        controller.view.addSubview(toastContainer)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toastContainer.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 30),
            toastContainer.heightAnchor.constraint(equalToConstant: 48),
            toastContainer.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20),
            toastContainer.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -20),
            image.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 28),
            image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 1),
            image.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor),
            toastLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            toastLabel.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor, constant: -12),
            toastLabel.centerYAnchor.constraint(equalTo: toastContainer.centerYAnchor),
            toastLabel.heightAnchor.constraint(equalToConstant: 32)
            ])
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}


@IBDesignable class GradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.white
    @IBInspectable var secondColor: UIColor = UIColor.black
    @IBInspectable var vertical: Bool = false
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [firstColor.cgColor, secondColor.cgColor]
        (layer as! CAGradientLayer).startPoint = CGPoint.zero
        (layer as! CAGradientLayer).endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
    }
    
}

@IBDesignable class Gradient_View: UIView {
    @IBInspectable var firstColor: UIColor = ColorConstants.transperentFirstColor
    @IBInspectable var secondColor: UIColor = ColorConstants.transperentSecondCoolor
    @IBInspectable var vertical: Bool = false

    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.startPoint = CGPoint.zero
        return layer
    }()

    
    //MARK: -
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyGradient()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyGradient()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }

    //MARK: -

    func applyGradient() {
        updateGradientDirection()
        layer.insertSublayer(gradientLayer, at: 0)
    }

    func updateGradientFrame() {
        gradientLayer.frame = bounds
    }

    func updateGradientDirection() {
        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
    }
}

@IBDesignable class ThreeColorsGradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.red
    @IBInspectable var secondColor: UIColor = UIColor.green
    @IBInspectable var thirdColor: UIColor = UIColor.blue

    @IBInspectable var vertical: Bool = true {
        didSet {
            updateGradientDirection()
        }
    }

    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        layer.startPoint = CGPoint.zero
        return layer
    }()

    //MARK: -

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        applyGradient()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        applyGradient()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }

    //MARK: -

    func applyGradient() {
        updateGradientDirection()
        layer.sublayers = [gradientLayer]
    }

    func updateGradientFrame() {
        gradientLayer.frame = bounds
    }

    func updateGradientDirection() {
        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
    }
}

@IBDesignable class RadialGradientView: UIView {

    @IBInspectable var outsideColor: UIColor = UIColor.red
    @IBInspectable var insideColor: UIColor = UIColor.green

    override func awakeFromNib() {
        super.awakeFromNib()

        applyGradient()
    }

    func applyGradient() {
        let colors = [insideColor.cgColor, outsideColor.cgColor] as CFArray
        let endRadius = sqrt(pow(frame.width/2, 2) + pow(frame.height/2, 2))
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        let context = UIGraphicsGetCurrentContext()

        context?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        #if TARGET_INTERFACE_BUILDER
            applyGradient()
        #endif
    }
}

class HorizontalGradientView: UIView {

    @IBInspectable
    var firstColor: UIColor = .white

    @IBInspectable
    var secondColor: UIColor = .black

    private let gradientLayerName = "Gradient"

    override func layoutSubviews() {
        super.layoutSubviews()

        setupGradient()
    }

    private func setupGradient() {
        var gradient: CAGradientLayer? = layer.sublayers?.first { $0.name == gradientLayerName } as? CAGradientLayer
        if gradient == nil {
            gradient = CAGradientLayer()
            gradient?.name = gradientLayerName
            layer.addSublayer(gradient!)
        }
        gradient?.frame = bounds
        gradient?.colors = [firstColor.withAlphaComponent(0.2).cgColor, secondColor.withAlphaComponent(0.4).cgColor]
        gradient?.startPoint = CGPoint.zero
        gradient?.endPoint = CGPoint(x: 1, y: 0)
       // gradient?.zPosition = -1
    }

}


