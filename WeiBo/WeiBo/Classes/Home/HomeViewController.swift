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
		
		// 1. 如果未登录设置未登录状态信息
		if !userLogin {
			self.visitorView?.setupVisitorView(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
			return
		}
		
		// 2. 设置登录状态导航栏
		setupNav()
    }
	
	private func setupNav() {
		// 1. 初始化导航栏左右按钮
		navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem("navigationbar_friendattention", target: self, action: #selector(HomeViewController.leftItemClick))
		navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem("navigationbar_pop", target: self, action: #selector(HomeViewController.rightItemClick))
		
		// 2. 初始化标题按钮
		let titleBtn = TitleButton()
		titleBtn.setTitle("AAAAAA ", forState: UIControlState.Normal)
		titleBtn.addTarget(self, action: #selector(HomeViewController.titleBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
		navigationItem.titleView = titleBtn
	}

	//MARK: - 按钮点击事件
	func leftItemClick() {
		print(#function)
	}
	
	func rightItemClick() {
		print(#function)
	}
	
	func titleBtnClick(btn: TitleButton) {
		btn.selected = !btn.selected
	}
}
