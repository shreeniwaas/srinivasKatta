//
//  UIPageControl+Extension.swift
//  CAMSfinserv
//
//  Created by Srinivas Katta on 21/10/21.
//

import Foundation
import UIKit

class BorderedPageControl: UIPageControl {

    var selectionColor: UIColor = .black
    
    override var currentPage: Int {
        didSet {
            updateBorderColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        currentPageIndicatorTintColor = selectionColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateBorderColor() {
        if #available(iOS 14.0, *) {
            let smallConfiguration = UIImage.SymbolConfiguration(pointSize: 8.0, weight: .bold)
            let circleFill = UIImage(systemName: "circle.fill", withConfiguration: smallConfiguration)
            let circle = UIImage(systemName: "circle", withConfiguration: smallConfiguration)
            for index in 0..<numberOfPages {
                if index == currentPage {
                    setIndicatorImage(circleFill, forPage: index)
                } else {
                    selectionColor = .black
                    setIndicatorImage(circle, forPage: index)
                }
            }
            pageIndicatorTintColor = selectionColor
        } else {
            subviews.enumerated().forEach { index, subview in
                if index != currentPage {
                    subview.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)//selectionColor.cgColor
                    subview.layer.borderWidth = 1
                } else {
                    subview.layer.borderWidth = 0
                }
            }
        }
    }
}

 
 

