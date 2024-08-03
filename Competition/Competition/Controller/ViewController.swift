//
//  ViewController.swift
//  Competition
//
//  Created by Md Shahin Alam on 2/8/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnShowPresent: UIButton!{
        didSet{
            self.btnShowPresent.addTarget(self, action: #selector(btnShowPresentAction), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func btnShowPresentAction(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PresentVC") as! PresentVC
        vc.modalPresentationStyle = .fullScreen 
        self.present(vc, animated: true)
        
    }

}
