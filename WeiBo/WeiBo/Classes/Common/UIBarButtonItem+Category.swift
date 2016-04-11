//
//  UIBarButtonItem+Category.swift
//  WeiBo
//
//  Created by 王潇 on 16/4/11.
//  Copyright © 2016年 王潇. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
	
	// func 前加上 class  就相当于OC 中的+
	class func creatBarButtonItem(imageName: String, target:AnyObject?, action: Selector) -> UIBarButtonItem {
		let button = UIButton()
		button.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
		button.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
		button.sizeToFit()
		button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
		return UIBarButtonItem(customView: button)
	}
}
