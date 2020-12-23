//
//  ViewController.swift
//  kubakbtsheet
//
//  Created by enakhi1@gmail.com on 12/02/2020.
//  Copyright (c) 2020 enakhi1@gmail.com. All rights reserved.
//
import kubakbtsheet
import UIKit

class ViewController: UIViewController ,kbBottomSheetListener{
    var mainView:UIView?
    func positionChanged(curentPosition: CGFloat, screenHeight: CGFloat) {
        //print("\(curentPosition)")
        let a:CGFloat
        let b:CGFloat
        if curentPosition >= screenHeight*0.5 {
            b = screenHeight * 0.5
            a = curentPosition-b

        }
        else{
            a=0
            b=1
        }
//        mainView!.removeConstraints(mainView!.constraints)
//        print("\(curentPosition):\(screenHeight)")
        var customConstraints = self.constraints
        NSLayoutConstraint.deactivate(customConstraints)
        customConstraints.forEach { $0.isActive = false }
        customConstraints.removeAll()
        self.constraints = [
            mainView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView!.widthAnchor.constraint(equalTo: view.widthAnchor,constant: (-50*(a/b))),
            mainView!.heightAnchor.constraint(equalTo: view.heightAnchor,constant: (-20*(a/b)))
        ]
        
        NSLayoutConstraint.activate(self.constraints)
        mainView!.layoutIfNeeded()
//
        
//        let constraints = [
//            viewA.topAnchor.constraint(equalTo: view.topAnchor),
//            viewA.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
//            viewA.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            viewA.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 40)
//        ]
//        mainView!.translatesA/utoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.ac/tivate(constraints)
    }
    var constraints:[NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let sheet = buildBottomSheet(useInlineMode: true)
        
        // Add child
        mainView = UIView()

        
        
        mainView!.backgroundColor = .red
        view.addSubview(mainView!)
        
        self.constraints = [
            mainView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView!.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainView!.heightAnchor.constraint(equalTo: view.heightAnchor )
        ]
//        NSLayoutConstraint.activate(constraints)
//
        
//        let constraints = [
//            viewA.topAnchor.constraint(equalTo: view.topAnchor),
//            viewA.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
//            viewA.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            viewA.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 40)
//        ]
        mainView!.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
        
        let button = UIButton(type: .system) // let preferred over var here
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.backgroundColor = UIColor.green
        button.setTitle("Button", for: UIControl.State.normal)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        
        
        
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
        sheet.addPositionStateListener(listener: self)
//        sheet.hasBlurBackground = true
        sheet.dismissOnPull = false
        sheet.dismissOnOverlayTap = false
        sheet.overlayColor=UIColor.clear
        sheet.cornerRadius = 30
        sheet.gripSize = CGSize(width: 100, height: 12)
        
        
        sheet.overlayColor = UIColor.clear
        sheet.allowGestureThroughOverlay = true
        return sheet
    }
}
