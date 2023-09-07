//
//  LoginVC.swift
//  Fix-Fixo
//
//  Created by Apple on 14/07/23.
//

import UIKit
import WMSegmentControl
enum SignUpTableRows : String {
    case loginEmail
    case loginPassword
    case firstName = "First Name"
    case lastName = "Last Name"
    case mobile = "Mobile"
    case email = "Email"
    case password = "Password"
}

class LoginVC: UIViewController {

      //MARK: - IBOutlets
    @IBOutlet weak var tblVw: UITableView!
    @IBOutlet weak var sgTextImageRound: WMSegment!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var bottomLoginBtn: UIButton!
    
    //MARK: - Constants And Variables
    var loginFieldsArray: [SignUpTableRows] = [.loginEmail, .loginPassword]
    var signUpFiledsArray: [SignUpTableRows] = [.firstName, .lastName, .mobile, .email, .password,]
    var isSelectedLogin = true
    var loginData = LoginDataModel()
    var signUpData = SignUpDataModel()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }
  
    //MARK: - Additionla Functions
    func registerCells() {
        tblVw.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "TextFieldTableViewCell")
        tblVw.register(UINib(nibName: "CaptchTableViewCell", bundle: nil), forCellReuseIdentifier: "CaptchTableViewCell")
    }

    
    func updateBtnTitle() {
        if isSelectedLogin {
            sgTextImageRound.setSelectedIndex(0)
            loginBtn.setTitle("Login", for: .normal)
            alreadyHaveAccountLabel.text = "Don't have an account?"
            bottomLoginBtn.setTitle("Sign Up", for: .normal)
        } else {
            sgTextImageRound.setSelectedIndex(1)
            loginBtn.setTitle("Sign Up", for: .normal)
            alreadyHaveAccountLabel.text = "Already have an account?"
            bottomLoginBtn.setTitle("Login", for: .normal)
        }
    }
    
    @IBAction func bottomLoginBtn(_ sender: UIButton) {
        isSelectedLogin = !isSelectedLogin
        updateBtnTitle()
        tblVw.reloadData()
    }
    
    //MARK: - IBActions
    @IBAction func segmentValueChange(_ sender: WMSegment) {
        print("selected index = \(sender.selectedSegmentIndex)")
        if sender.selectedSegmentIndex == 0 {
            isSelectedLogin = true
        } else {
            isSelectedLogin = false
        }
        updateBtnTitle()
        tblVw.reloadData()
    }
    
    @IBAction func loginAndSignUpBtnAction(_ sender: UIButton) {
        if isSelectedLogin {
          
        } else {
            
        }
    }
    
}

//MARK: - TableViewDelegate And TableViewDataSource
extension LoginVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return isSelectedLogin ? loginFieldsArray.count : signUpFiledsArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tblVw.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell", for: indexPath) as! TextFieldTableViewCell
            
            let data: [SignUpTableRows]  = isSelectedLogin ? loginFieldsArray : signUpFiledsArray
            let row = data[indexPath.row]
            
            cell.delegate = self
            cell.cellType = row
            
            switch row {
            case .loginEmail:
                cell.loadData(title: "Email", titleValue: loginData.email ?? "", img: "Email_icon" )
            case .loginPassword:
                cell.loadData(title: "Password", titleValue: loginData.password ?? "", img: "Lock")
            case .firstName:
                cell.loadData(title: row.rawValue, titleValue: signUpData.firstName ?? "", img: "user")
            case .lastName:
                cell.loadData(title: row.rawValue, titleValue: signUpData.lastName ?? "", img: "user")
            case .mobile:
                cell.loadData(title: row.rawValue, titleValue: signUpData.mobile ?? "", img: "smartphone")
            case .email:
                cell.loadData(title: row.rawValue, titleValue: signUpData.email ?? "", img: "Email_icon")
            case .password:
                cell.loadData(title: row.rawValue, titleValue: signUpData.password ?? "", img: "Lock")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CaptchTableViewCell") as! CaptchTableViewCell
            
            return cell
        }
       
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//       return UIView()
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 160
//    }
}

struct LoginDataModel {
    var email: String?
    var password: String?
}

struct SignUpDataModel {
    var firstName: String?
    var lastName: String?
    var mobile: String?
    var email: String?
    var password: String?
}

// MARK: - SignUpInputCellEvents Delegates
extension LoginVC: SignUpInputCellEvents {
    func didUpdateText(text: String?, cellType: SignUpTableRows) {
        switch cellType {
        case .loginEmail:
            self.loginData.email = text
        case .loginPassword:
            self.loginData.password = text
        case .firstName:
            self.signUpData.firstName = text
        case .lastName:
            self.signUpData.lastName = text
        case .mobile:
            self.signUpData.mobile = text
        case .email:
            self.signUpData.email = text
        case .password:
            self.signUpData.password = text
        }
    }
}
