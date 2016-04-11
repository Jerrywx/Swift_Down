//
//  DiscoverViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		if !userLogin {
			self.visitorView?.setupVisitorView(false, imageName: "visitordiscover_image_message", message: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
		}
    }
}
