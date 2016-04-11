//
//  MessageViewController.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/10.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		if !userLogin {
			self.visitorView?.setupVisitorView(false, imageName: "visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
		}
    }

}
