//
//  SecondViewController.swift
//  GoodAsOldPhones
//
//  Created by 王潇 on 2017/2/12.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

	///
	var scrollView:UIScrollView?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
	
}

// MARK: - 初始化界面
extension SecondViewController {
	
	fileprivate func setupUI() {
		view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		scrollView = UIScrollView(frame: CGRect(x: 0, 
		                                        y: 0, 
		                                        width: self.view.bounds.width,
		                                        height: self.view.bounds.height - 46))
		view.addSubview(scrollView!)
		scrollView?.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
		
		addSubViews()
	}
	
	private func addSubViews() {
		
		let width = view.bounds.width
		/// 图片
		let image	 = #imageLiteral(resourceName: "header-contact")
		let imgFrame = CGRect(x: 0, y: 0, 
		                      width: width,
		                      height: width / (image.size.width / image.size.height))
		let imageView	= UIImageView(frame: imgFrame)
		imageView.image = image
		scrollView?.addSubview(imageView)
		
		/// 
		let titleY = imgFrame.maxY + 60
		let frame = CGRect(x: 0, y: titleY, width: width, height: 30)
		let title = UILabel(frame: frame)
		title.textAlignment = .center
		title.text = "About me"
		title.font = UIFont(name: "DamascusBold", size: 24)
		view.addSubview(title)
	}
}
