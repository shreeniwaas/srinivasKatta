//
//  Constants.swift
//  CAMSfinserv
//
//  Created by  Macbook on 23/10/21.
//

import Foundation
import UIKit

struct ColorConstants{
    static let accentColor: UIColor = #colorLiteral(red: 0.1450980392, green: 0, blue: 0.7647058824, alpha: 1)
    static let disableBtnColor: UIColor = #colorLiteral(red: 0.6980392157, green: 0.7333333333, blue: 0.7764705882, alpha: 1)
    static let progressColor:UIColor = #colorLiteral(red: 0.2862745098, green: 0.9607843137, blue: 0.9411764706, alpha: 1)
    static let transperentFirstColor: UIColor = #colorLiteral(red: 0.9764705882, green: 0.8352941176, blue: 0.6549019608, alpha: 1)
    static let transperentSecondCoolor: UIColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    static let greenColor: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
}

struct APP_URL{
    private static let BASE_URL = "https://uat.camsfinserv.com/api/aa/MPortalapiV1/"
    static let USERURL = BASE_URL + "USERREGMOBILE"

}
