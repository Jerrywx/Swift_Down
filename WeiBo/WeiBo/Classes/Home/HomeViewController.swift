//
//  HomeViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		if !userLogin {
			self.visitorView?.setupVisitorView(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
		}
    }
}
