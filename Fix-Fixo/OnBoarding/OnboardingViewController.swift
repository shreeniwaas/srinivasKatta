//
//  OnboardingViewController.swift
//  Fix-Fixo
//
//  Created by admin on 24/07/23.
//

import UIKit

class OnboardingViewController: UIViewController,Storyboardable {
    //MARK: - IBOutLets
    @IBOutlet weak var onBoardImage: UIImageView!
    @IBOutlet weak var bView: CardView!

    @IBOutlet weak var getStartBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var firstDescLbl: UILabel!
    @IBOutlet weak var skipBtnOL: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var timer = Timer()

    //MARK: - Variables
   
    var onboardingData: [Onboarding] = [
        Onboarding(title: "Welcome", firstDescription: "Continuous upgradation of resources in order to achieve confidence", image: UIImage(named: "Group")!, bgcolor: #colorLiteral(red: 0, green: 0.6823529412, blue: 0.7254901961, alpha: 1)),
        Onboarding(title: "Seamless Communication", firstDescription: " Continuous upgradation of resources in order to achieve confidence", image: UIImage(named: "Logo")!, bgcolor: #colorLiteral(red: 0.2705882353, green: 0.1058823529, blue: 0.6274509804, alpha: 1)),
        Onboarding(title: "Strategic Partnership", firstDescription: "Continuous upgradation of resources in order to achieve confidence", image: UIImage(named: "Lock")!, bgcolor: #colorLiteral(red: 0.7411764706, green: 0.4078431373, blue: 0.9764705882, alpha: 1))
    ]
    var selectedIndex = 0
    //MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartBtn.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view!.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view!.addGestureRecognizer(swipeRight)
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

    }
    override func viewDidAppear(_ animated: Bool) {
        setup(onboardingData[selectedIndex])
        pageControl.currentPage = selectedIndex
    }
//MARK: - IBActions
    
    @IBAction func skipBtnAction(_ sender: UIButton) {
    }
    @IBAction func getStartedBtnAction(_ sender: UIButton) {
        
    }
    //MARK: - Functionality
    
    @objc func timerAction() {
//        self.onBoardImage.image = onboard.image
        pageControl.currentPage = selectedIndex
        print("ssssss")
        }
    func setup(_ onboard: Onboarding){
        titleLbl.text = onboard.title
        firstDescLbl.text = onboard.firstDescription
        bView.backgroundColor = UIColor.red//onboard.bgcolor
        UIView.transition(with:onBoardImage,duration: 0.4, options: [.curveLinear] , animations: {
            self.onBoardImage.image = onboard.image
            print("ssssss")
        }, completion: nil)
        print("tttt")
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
            swipeRight()
        }
        
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            swipeLeft()
        }
    }
    func swipeRight(){
        if selectedIndex > 0{
            setup(onboardingData[selectedIndex-1])
            selectedIndex -= 1
            pageControl.currentPage = selectedIndex
        }
        if selectedIndex == 2{
            skipBtnOL.isHidden = true
            getStartBtn.isHidden = false
        }else{
            skipBtnOL.isHidden = false
            getStartBtn.isHidden = true
        }
    }
    func swipeLeft(isBtn: Bool = false){
        if selectedIndex < 2{
            setup(onboardingData[selectedIndex+1])
            selectedIndex += 1
            pageControl.currentPage = selectedIndex
        }else{
            // next screen
//            let vc = FirstRegisterViewController.instantiate()
//                    navigationController?.pushViewController(vc, animated: true)
                       
        }
        if selectedIndex == 2{
            skipBtnOL.isHidden = true
            getStartBtn.isHidden = false
        }else{
            skipBtnOL.isHidden = false
            getStartBtn.isHidden = true
        }
    }
}


struct Onboarding{
    var title: String
    var firstDescription: String
    var image: UIImage
    var bgcolor: UIColor

}
