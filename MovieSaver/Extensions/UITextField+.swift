import UIKit

extension UITextField {
    func setUnderLine(_ color: UIColor = UIColor.opaqueSeparator ) {
            let border = CALayer()
            let width = CGFloat(1)
            border.borderColor = color.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
}
