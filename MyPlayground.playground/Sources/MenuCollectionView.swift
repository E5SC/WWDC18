import UIKit

private let reuseIdentifier = "cell"

public class MenuCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    let names = ["Mercurio", "Venus", "Tierra", "Luna", "Marte", "Jupiter", "Saturno", "Urano", "Neptuno"]
    let imagesNames = ["mercurio.jpg", "venus.jpg", "earth.jpg", "luna.jpg", "marte.jpg", "jupiter.jpg", "saturno.jpg", "urano.jpg", "neptuno.jpg"]
    
    public init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 38, alpha: 1)
        
        self.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
        cell.PlanetName?.text? = names[indexPath.item]
        cell.PlanetImage?.image = UIImage(named: imagesNames[indexPath.row])?.cropToSquare().cropToCircle()
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.size.width/2)-10, height: (((self.frame.size.width/2)-10)*1.4)+25)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCollectionViewCell
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 5, 0, 5)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

