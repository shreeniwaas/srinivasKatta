//
//  TextFieldTableViewCell.swift
//  Fix-Fixo
//
//  Created by Kishore B on 7/17/23.
//

import UIKit

protocol SignUpInputCellEvents: AnyObject {
    func didUpdateText(text: String?, cellType: SignUpTableRows)
}


class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var txtFld: UITextField!
    @IBOutlet weak var rightImgBgView: UIView!
    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var leftImgBgView: UIView!
    @IBOutlet weak var leftImg: UIImageView!
    
    weak var delegate: SignUpInputCellEvents? // loginvc
    var cellType : SignUpTableRows?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtFld.delegate = self
    }

    func loadData(title: String, titleValue: String, img: String) {
        titleLabel.text = title
        txtFld.text = titleValue
        leftImg.image = UIImage(named: img)
        
        if cellType == .loginPassword {
            rightImgBgView.isHidden = false
            rightImg.isHidden = false
            rightImg.image = UIImage(named: "eye")
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension TextFieldTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let updatedText = text.replacingCharacters(in: range, with: string)

            switch cellType {
            case .loginEmail:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .loginEmail)
            case .loginPassword:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .loginPassword)
            case .firstName:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .firstName)
            case .lastName:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .lastName)
            case .email:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .email)
            case .mobile:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .mobile)
            case .password:
                self.delegate?.didUpdateText(text: updatedText, cellType: self.cellType ?? .password)
                
            case .none:
                break
           
            }
        }
        return true
    }

}
