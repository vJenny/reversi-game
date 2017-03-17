import Foundation
import UIKit

public class ButtonController {
    private var button: UIButton
    @objc public func buttonTouched() {
        UIView.transition(with: self.button, duration: 0.5, options: .transitionCrossDissolve, animations: { self.button.isHighlighted = false }, completion: nil)
    }
    
    public init(button: UIButton){
        self.button = button
    }
}

public class Button: UIButton {
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
     }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        let clr = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.580, 0.000, 0.827, 1.0])
        setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .highlighted)
        layer.borderWidth = 2
        layer.borderColor = clr
        titleLabel?.font = UIFont(name: "GillSans", size: 20)
        setBackgroundImage(createImage(size: frame.size, color: clr!), for: .highlighted)
    }
    
}

public func createImage(size: CGSize, color: CGColor) -> UIImage {
    let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color)
    context!.fill(rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return img!
}
