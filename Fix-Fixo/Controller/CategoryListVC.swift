//
//  CategoryListVC.swift
//  Fix-Fixo
//
//  Created by admin on 23/07/23.
//

import UIKit

protocol CategoryListVcDelegates: NSObject {
    func passSelectedCategory(selectedData: String)
}

class CategoryListVC: UIViewController {
    
    //MARK: - IBOutLets
    @IBOutlet weak var categoryListTableVW: UITableView!
    
    //MARK: - Constants and Variables
    weak var delegate: CategoryListVcDelegates?
    var selectedCategoryTypes = ["Painting","Handyman","Flooring","Electricians","Landscape","Blinds","Carpenter","Roofing","Mechanical"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    func registerCells() {
        categoryListTableVW.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellReuseIdentifier: "CategoryListCell")
    }
}
extension CategoryListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategoryTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryListTableVW.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as! CategoryListCell
        cell.categoryNameLbl.text = selectedCategoryTypes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            let selectedRowData = self.selectedCategoryTypes[indexPath.row]
            self.delegate?.passSelectedCategory(selectedData: selectedRowData)
        }
    }
    
}
