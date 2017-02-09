//
//  SideViewController.swift
//  Snapchat Menu
//
//  Created by 王潇 on 2017/2/9.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class SideViewController: UIViewController {

	let imageView = UIImageView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		imageView.frame = UIScreen.main.bounds
		view.addSubview(imageView)
    }
}
