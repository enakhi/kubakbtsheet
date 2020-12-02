//
//  ViewController.swift
//  kubakbtsheet
//
//  Created by enakhi1@gmail.com on 12/02/2020.
//  Copyright (c) 2020 enakhi1@gmail.com. All rights reserved.
//
import kubakbtsheet
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sheet = buildBottomSheet(useInlineMode: true)
        
        // Add child
        sheet.willMove(toParent: self)
        self.addChild(sheet)
        self.view.addSubview(sheet.view)
        sheet.didMove(toParent: self)
        
        sheet.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheet.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            sheet.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            sheet.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sheet.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
//        sheet.didDismiss = { [weak self] _ in
//            print("did dismiss")
//            self?.mapView?.removeFromSuperview()
//            self?.stackViewBottomConstraint.constant = 20
//        }
        
        sheet.shouldDismiss = { _ in
            print("should dismiss")
            return true
        }
        
        // animate in
        sheet.animateIn()
        view.backgroundColor=UIColor.white
//        for demo in demos {
//            self.addButton(demo: demo)
//        }
        
       // self.sheetViewController?.handleScrollView(self.scrollView)
    }
//    var count=0;
//    func addButton(demo: String) {
//        let button = UIButton(frame: CGRect(x: 100, y: 100+count*50, width: 100, height: 50))
//        self.count+=1
//        button.setTitle(demo, for: .normal)
//        button.backgroundColor = UIColor.red
////        button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
//        if #available(iOS 13.0, *) {
//            button.setTitleColor(.label, for: .normal)
//        } else {
//            button.setTitleColor(UIColor.darkText, for: .normal)
//        }
//        self.view.addSubview(button)
//    }
//    func buttonAction(sender: UIButton!) {
//      print("Button tapped")
//    }
    func buildBottomSheet(useInlineMode: Bool) -> SheetViewController {
        let controller = BottomViewController()
//        controller.coordinator = coordinator
        
        var options = SheetOptions()
        options.pullBarHeight = 30
        options.useInlineMode = useInlineMode
        
        let sheet = SheetViewController(controller: controller,
//                                        sizes: [.percent(0.8), .fullscreen],
                                        sizes: [.fixed(200), .fixed(300), .fixed(450), .marginFromTop(200),.fullscreen],
                                        options: options)
        sheet.hasBlurBackground = true
        sheet.dismissOnPull = false
        sheet.dismissOnOverlayTap = false
        sheet.cornerRadius = 30
        sheet.gripSize = CGSize(width: 100, height: 12)
        return sheet
    }
}
