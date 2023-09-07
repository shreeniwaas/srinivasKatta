//
//  CategoriesVC.swift
//  Fix-Fixo
//
//  Created by admin on 19/07/23.
//

import UIKit


class CategoriesVC: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!

    var categoriesTypesArray = [CategoryDataModel]()
    var selectIndexPath : IndexPath?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.sectionHeaderTopPadding = 0.0
        registerNib()
        loadData()
    }
    
    func loadData() {
   
        categoriesTypesArray.append(CategoryDataModel(headerTitle: "Select Location", rows: [CategoryRowDetails(title: "Select YourCity", value: "Select"),
                                                                                      CategoryRowDetails(title: "Select Your area", value: "Select")]
                                                     ))
        categoriesTypesArray.append(CategoryDataModel(headerTitle: "Select Category", rows: [CategoryRowDetails(title: "Category", value: "Select")]))
    }
    
    func registerNib(){
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        categoryTableView.register(UINib(nibName: "HeaderTitleCategoryCell", bundle: nil), forCellReuseIdentifier: "HeaderTitleCategoryCell")
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func continueBtnAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let VC = storyBoard.instantiateViewController(withIdentifier: "CategoryListVC") as! CategoryListVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension CategoriesVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoriesTypesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesTypesArray[section].rows.count
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = categoryTableView.dequeueReusableCell(withIdentifier: "HeaderTitleCategoryCell") as! HeaderTitleCategoryCell
        sectionHeaderView.headerTitleLbl.text = categoriesTypesArray[section].headerTitle
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        let row = indexPath.row
        let rowData = categoriesTypesArray[indexPath.section].rows[row]
        cell.loadData(date: rowData, row: row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected selection: \(indexPath.section) --> row: \(indexPath.row)")
        selectIndexPath = indexPath
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "CategoryListVC") as! CategoryListVC
        nextVC.delegate = self
        self.navigationController?.present(nextVC, animated: true)
    }
  
}

extension CategoriesVC: CategoryListVcDelegates {
    func passSelectedCategory(selectedData: String) {
        let selectedSection = selectIndexPath?.section ?? 0
        let selectedRow = selectIndexPath?.row ?? 0
        categoriesTypesArray[selectedSection].rows[selectedRow].value = selectedData
        categoryTableView.reloadData()
    }
}

struct CategoryDataModel {
    var headerTitle: String
    var rows: [CategoryRowDetails]
}

struct CategoryRowDetails {
    var title: String
    var value: String?
}
