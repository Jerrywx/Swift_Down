//
//  ProfileViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		if !userLogin {
			self.visitorView?.setupVisitorView(false, imageName: "visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
		}
    }

}
