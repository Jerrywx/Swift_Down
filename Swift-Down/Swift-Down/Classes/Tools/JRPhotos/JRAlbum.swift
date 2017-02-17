//
//  JRAlbum.swift
//  Swift-Down
//
//  Created by 王潇 on 2017/2/17.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import Photos

class JRAlbum: NSObject {

	var allAlbums:Array<Any>?
	
	/// 获取所有的相册
	func getAllAlbums() {
		
		///
//		let result:PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, 
//		                                                                   subtype: .albumRegular, 
//		                                                                   options: nil)
//
//		result.enumerateObjects({ (asset:PHAssetCollection, index: Int, _) in
//			
//			
//			let res:PHFetchResult = PHAsset.fetchKeyAssets(in: asset, options: nil)!
//			print(asset.localizedTitle)
//			print(res.count)
//			
////			res?.enumerateObjects({ (asset:PHAsset, index:Int, _) in
////			})
//		})
		
		///========================================
		let option = PHFetchOptions()
		
		
		let res = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
		                                                  subtype: .albumMyPhotoStream,
		                                                  options: nil)
		
		res.enumerateObjects({ (colc:PHAssetCollection, index, _) in
			let fetchResult:PHFetchResult = PHAsset.fetchKeyAssets(in: colc, options: option)!
			print(colc.localizedTitle!)
			print(fetchResult.count)
			
			fetchResult.enumerateObjects({ (asset:PHAsset, index, _) in
				print("======")
			})
		})
		
	}
}
