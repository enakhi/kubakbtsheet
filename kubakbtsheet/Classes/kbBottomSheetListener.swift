//
//  kbBottomSheetListener.swift
//  kubakbtsheet
//
//  Created by Behnam Hosseini on 12/5/20.
//
import Foundation

@objc public protocol kbBottomSheetListener: AnyObject {
    
    func positionChanged(curentPosition: CGFloat,screenHeight: CGFloat)
  
}
