//
//  String+Additions.swift
//  OpenTokChatDemo
//
//  Created by Hitender kumar on 15/03/21.
//  Copyright © 2018 Hitender kumar. All rights reserved.
//

import UIKit

extension String{
    func dateConvert() -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MMM/yyyy"
        let date: Date? = dateFormatterGet.date(from: self)
        if let date = date{
            return dateFormatterPrint.string(from: date)
        }else{
            return ""
        }
        
    }
    func dateConvertt() -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "YYYY-MM-dd HH:MM:SS EEE"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:MM:SS"
        let date: Date? = dateFormatterGet.date(from: self)
        if let date = date{
            return dateFormatterPrint.string(from: date)
        }else{
            return ""
        }
        
    }
}

extension String{
    func timeAndDateConvert() -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy, h:mm a"
        let date: Date? = dateFormatterGet.date(from: self)
        if let date = date{
            return dateFormatterPrint.string(from: date)
        }else{
            return ""
        }
        
    }
}

extension String {
    func boldText(_ boldTxt : String) -> NSMutableAttributedString {
            let attrStr = NSMutableAttributedString.init(string: self)
            let boldedRange = NSRange(self.range(of: boldTxt)!, in: self)
        attrStr.addAttributes([NSAttributedString.Key.font : UIFont(name: "Gilroy-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16)], range: boldedRange)
            return attrStr
        }
}

extension String {
    func highlightedText(_ boldTxt : String) -> NSMutableAttributedString {
            let attrStr = NSMutableAttributedString.init(string: self)
            let boldedRange = NSRange(self.range(of: boldTxt)!, in: self)
        attrStr.addAttributes([NSAttributedString.Key.font : UIFont(name: "Gilroy-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: ColorConstants.accentColor], range: boldedRange)
            return attrStr
        }
}
