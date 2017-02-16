//
//  AddViewController.swift
//  Todo
//
//  Created by 王潇 on 2017/2/15.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupUI()
	}
}

extension AddViewController {
	
	fileprivate func setupUI() {
		
		view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		title = "Add"
	}
}
