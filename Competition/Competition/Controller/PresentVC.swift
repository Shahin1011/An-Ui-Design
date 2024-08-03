//
//  ViewController.swift
//  Competition
//
//  Created by Md Shahin Alam on 1/8/24.
//

import UIKit

class PresentVC: UIViewController {


    //MARK: Outlets
    
    @IBOutlet weak var perWeekView: UIView!
    @IBOutlet weak var innerPerWeekView: UIView!
    @IBOutlet weak var perYearView: UIView!
    @IBOutlet weak var innerPerYearView: UIView!
    @IBOutlet weak var perWeekCircle: UIImageView!
    @IBOutlet weak var perYearCircle: UIImageView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var btnClose: UIButton!{
        didSet{
            self.btnClose.addTarget(self, action: #selector(btnCloseAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var btnForPerWeek: UIButton!{
        didSet{
            self.btnForPerWeek.addTarget(self, action: #selector(btnForPerWeekAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var btnForPerYear: UIButton!{
        didSet{
            self.btnForPerYear.addTarget(self, action: #selector(btnForPerYearAction), for: .touchUpInside)
        }
    }
    
    // MARK: Properties
    
    var imageArray = ["image1", "image2"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: SliderCVCell.identifier, bundle: nil)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: SliderCVCell.identifier)
        self.sliderCollectionView.dataSource = self
        self.sliderCollectionView.delegate = self
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollingSetup), userInfo: nil, repeats: true)
        
        self.perWeekView.layer.cornerRadius = 20
        self.perWeekView.layer.borderWidth = 3
        self.perWeekView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        
        self.perYearView.layer.cornerRadius = 20
        self.perYearView.layer.borderWidth = 3
        self.perYearView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        
        perWeekCircle.image = UIImage(named: "Empty")
        perYearCircle.image = UIImage(named: "Empty")
        
    }
    
    // MARK: Functions
    
    @objc func scrollingSetup(){
        if index < imageArray.count - 1 {
            index = index + 1
        }else{
            index = 0
        }
        
        pageController.numberOfPages = imageArray.count
        pageController.currentPage = index
        sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
        
    }
    
    @objc func btnCloseAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func btnForPerWeekAction(){
        
        self.perWeekView.layer.cornerRadius = 20
        self.perWeekView.layer.borderWidth = 3
        self.perWeekView.layer.borderColor = UIColor.blue.cgColor
        self.innerPerWeekView.backgroundColor = UIColor(named: "Color11")
        perWeekCircle.image = UIImage(named: "Filled")
        
        self.perYearView.layer.cornerRadius = 20
        self.perYearView.layer.borderWidth = 3
        self.perYearView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        self.innerPerYearView.backgroundColor = UIColor.opaqueSeparator
        perYearCircle.image = UIImage(named: "Empty")
    }
    @objc func btnForPerYearAction(){
        
        self.perYearView.layer.cornerRadius = 20
        self.perYearView.layer.borderWidth = 3
        self.perYearView.layer.borderColor = UIColor.blue.cgColor
        self.innerPerYearView.backgroundColor = UIColor(named: "Color11")
        perYearCircle.image = UIImage(named: "Filled")
        
        self.perWeekView.layer.cornerRadius = 20
        self.perWeekView.layer.borderWidth = 3
        self.perWeekView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        self.innerPerWeekView.backgroundColor = UIColor.opaqueSeparator
        perWeekCircle.image = UIImage(named: "Empty")
        
        
    }


}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension PresentVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCVCell.identifier, for: indexPath) as! SliderCVCell
        
        cell.sliderImageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

