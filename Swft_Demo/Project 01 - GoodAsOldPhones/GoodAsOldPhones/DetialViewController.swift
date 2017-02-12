//
//  DetialViewController.swift
//  GoodAsOldPhones
//
//  Created by 王潇 on 2017/2/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class DetialViewController: UIViewController {

	/// 属性
	var imageView:UIImageView?
	var product:Product?
	var titleLabel:UILabel?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
    }
}

// MARK: - 初始化界面
extension DetialViewController {
	
	fileprivate func setupUI() {
		
		view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		///
		guard product != nil else {
			return
		}
		
		/// 图片
		imageView = UIImageView(frame: view.bounds)
		view.addSubview(imageView!)
		imageView?.image = UIImage(named: (product?.fullscreenImageName)!)
		
		/// 标题
		titleLabel		 = UILabel()
		titleLabel?.text = product?.name
		titleLabel?.font = UIFont(name: "DamascusBold", size: 24)
		titleLabel?.textAlignment = .center
		titleLabel?.frame = CGRect(x: 0,
		                           y: 120,
		                           width: view.bounds.size.width, 
		                           height: 35)
		view.addSubview(titleLabel!)
		
		/// 
		let button	  = UIButton(frame: CGRect(x: 0, y: 0, width: 158, height: 41))
		button.center = CGPoint(x: view.bounds.size.width * 0.5, y: 200)
		button.addTarget(self, action: #selector(buttonAct), for: .touchUpInside)
		button.setBackgroundImage(#imageLiteral(resourceName: "button-addtocart"), for: .normal)
		button.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
		view.addSubview(button)
	}
	
	func buttonAct() {
		print(#function)
	}
}

