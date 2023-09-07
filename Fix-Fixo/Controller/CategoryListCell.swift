//
//  CategoryListCell.swift
//  Fix-Fixo
//
//  Created by admin on 23/07/23.
//

import UIKit

class CategoryListCell: UITableViewCell {

    @IBOutlet weak var selectedBtn: UIButton!
    @IBOutlet weak var categoryNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func categoryLoadData(title: String, titleValue: String, img: String) {
        categoryNameLbl.text = title
//        txtFld.text = titleValue
//        selectedBtn.image = UIImage(named: img)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
