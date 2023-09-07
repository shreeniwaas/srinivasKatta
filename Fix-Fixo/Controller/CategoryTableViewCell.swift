//
//  CategoryTableViewCell.swift
//  Fix-Fixo
//
//  Created by admin on 23/07/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var bgView: UIView!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(date: CategoryRowDetails, row: Int) {
        titleLabel.text = date.title
        valueLabel.text = date.value
        
        if row == 0 {
            // add bgview top corner radius
        } else {
            // bottom
        }
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
