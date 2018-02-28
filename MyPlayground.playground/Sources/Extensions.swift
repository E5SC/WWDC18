import UIKit

public extension UILabel {
    func Setup(fontSize: CGFloat) {
        
        let cfFontURL = Bundle.main.url(forResource: "font", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfFontURL, CTFontManagerScope.process, nil)
        
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.white.cgColor
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .center
        self.textColor = .white
        self.font = UIFont(name: "Myriad Set Pro", size: fontSize)
    }
    
    func ChangePlanet(Text: String) {
        UIView.transition(
            with: self,
            duration: 0.5,
            options: [.transitionCrossDissolve],
            animations: {
                
                self.text = Text
                
        }, completion: nil)
    }
    
    func getTextSize()->CGSize {
        return ((self.text)?.size(withAttributes: [NSAttributedStringKey.font: self.font]))!
    }
}

public extension UIImage {
    func cropToSquare() -> UIImage {
        var rect = CGRect(x: (self.size.width - self.size.height)/2, y: (self.size.height - self.size.height)/2, width: self.size.height, height: self.size.height)
        
        rect.origin.x*=self.scale
        rect.origin.y*=self.scale
        rect.size.width*=self.scale
        rect.size.height*=self.scale
        
        let imageRef = self.cgImage!.cropping(to: rect)
        let image = UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
        return image
    }
    
    func cropToCircle() -> UIImage {
        let imageView: UIImageView = UIImageView(image: self)
        var layer: CALayer = CALayer()
        layer = imageView.layer
        
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(self.size.height/2)
        
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundedImage!
    }
}

