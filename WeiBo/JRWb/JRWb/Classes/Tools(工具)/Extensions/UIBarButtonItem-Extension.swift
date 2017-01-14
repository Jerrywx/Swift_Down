//
//  UIBarButtonItem-Extension.swift
//  JRWb
//
//  Created by 王潇 on 2017/1/14.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
	
	convenience init(title: String, fontSize: CGFloat = 16, target: Any?, action: Selector) {

		let button: UIButton = UIButton.cz_textButton(title, fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
		
		button.addTarget(target, action: action, for: .touchUpInside)
		
		self.init(customView: button)
	}
	
}
