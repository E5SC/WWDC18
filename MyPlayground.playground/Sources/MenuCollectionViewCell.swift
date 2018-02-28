import UIKit

public class MenuCollectionViewCell: UICollectionViewCell {
    
    public var PlanetName:UILabel!
    public var PlanetImage:UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        let PlanetViewWidth = self.frame.size.width
        let PlanetViewHeight = self.frame.size.height
        
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = PlanetViewWidth/10
        
        PlanetName = UILabel(frame: CGRect(x: 15, y: 2, width: PlanetViewWidth, height: PlanetViewHeight/2.5))
        PlanetImage = UIImageView(frame: CGRect(x: PlanetViewWidth/4, y: PlanetName.frame.maxY+2, width: PlanetViewWidth, height: PlanetViewWidth))
        
        PlanetImage.contentMode = .scaleAspectFit
        
        PlanetImage.layer.shadowOffset = CGSize(width: 0.9, height: 0.9)
        PlanetImage.layer.shadowOpacity = 1
        PlanetImage.layer.shadowRadius = 3
        PlanetImage.layer.shadowColor = UIColor.black.cgColor
        
        let cfFontURL = Bundle.main.url(forResource: "Sources/font", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfFontURL, CTFontManagerScope.process, nil)
        
        PlanetName.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
        PlanetName.layer.shadowOpacity = 1
        PlanetName.layer.shadowRadius = 3
        PlanetName.layer.shadowColor = UIColor.black.cgColor
        PlanetName.adjustsFontSizeToFitWidth = true
        PlanetName.textAlignment = .left
        PlanetName.textColor = UIColor(red: 0, green: 0, blue: 38, alpha: 1)
        PlanetName.font = UIFont(name: "Myriad Set Pro", size: PlanetViewHeight/6)
        
        self.addSubview(PlanetName)
        self.addSubview(PlanetImage)
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
