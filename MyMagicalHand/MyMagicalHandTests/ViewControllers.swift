import UIKit
@testable import MyMagicalHand

func bringRootViewController() -> ViewController {
    let window = UIApplication.shared.windows[0]
    return window.rootViewController as! ViewController
}
