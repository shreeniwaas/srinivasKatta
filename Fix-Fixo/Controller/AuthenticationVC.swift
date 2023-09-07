//
//  AuthenticationVC.swift
//  
//
//  Created by admin on 20/07/23.
//

import UIKit
import LocalAuthentication
class AuthenticationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func authenticationBtnAction(_ sender: UIButton) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, AuthenticationError in
                DispatchQueue.main.async {
                    if success{
                        let vc = UIViewController()
                        vc.title = "Welcome"
                        vc.view.backgroundColor = .systemBlue
                        self?.present(UINavigationController(rootViewController: vc), animated: true,completion: nil)
                        
                    }else{
                        let ac = UIAlertController(title: "Authentication failed", message: "you could not verified please try again", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "ok", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        }else{
            let ac = UIAlertController(title: "Biometry unavailable", message: "your device is not configured for biometry authentication", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(ac, animated: true)
        }
    }
    
}
