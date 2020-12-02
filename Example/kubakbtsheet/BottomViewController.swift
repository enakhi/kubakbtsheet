
import Foundation
import kubakbtsheet
import UIKit

class BottomViewController: UIViewController {
    var coordinator: Coordinator!
    
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    
    var demos = [String](repeating: "0000", count: 10)
    
    override func viewDidLoad() {
        view.backgroundColor=UIColor.white

                for demo in demos {
                    self.addButton(demo: demo)
                }
                self.sheetViewController?.handleScrollView(self.scrollView)
            }

    var count=0;
    func addButton(demo: String) {
        let button = UIButton(frame: CGRect(x: 100, y: 100+count*50, width: 100, height: 50))
        self.count+=1
        button.setTitle(demo, for: .normal)
        button.backgroundColor = UIColor.init(red: 0.5 , green: 0.5, blue: 0.5, alpha: 1.0)
//        button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        if #available(iOS 13.0, *) {
            button.setTitleColor(.label, for: .normal)
        } else {
            button.setTitleColor(UIColor.darkText, for: .normal)
        }
        self.view.addSubview(button)
    }
    func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }

}
