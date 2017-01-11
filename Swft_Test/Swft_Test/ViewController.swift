//
//  ViewController.swift
//  Swft_Test
//
//  Created by 王潇 on 2017/1/10.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	func demo() {
		let context = CIContext()                                           // 1
		
		let filter	= CIFilter(name: "CISepiaTone")!                         // 2
		filter.setValue(0.8, forKey: kCIInputIntensityKey)
//		let image	= CIImage(contentsOfURL: myURL)                           // 3
		let img		= #imageLiteral(resourceName: "a")
		let image   = img.ciImage
		filter.setValue(image, forKey: kCIInputImageKey)
		let result	= filter.outputImage!                                    // 4
		let cgImage = context.createCGImage(result, from: result.extent)    // 5
	}
}

