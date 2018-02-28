import Foundation

public struct Constants {
    
    static public let order = ["Mercurio", "Venus", "Tierra", "Marte", "Jupiter", "Saturno", "Urano", "Neptuno"]
    static public let names = ["Sun", "Mercurio", "Venus", "Tierra", "Luna", "Marte", "Jupiter", "Saturno", "Urano", "Neptuno"]
    static public let inclination = [7.004, 3.4, 7.15, 5.14, 1.85, 1.3, 2.48, 0.772, 1.76]
    static public let gravity = [3.7, 8.87, 9.8, 1.6, 3.711, 24.79, 10.44, 8.69, 11.15]
    static public let diameterSun = 1394000000
    
    //Constant to pass the diameter to a number between 0 and 10 to apply to SCNGeometry in radius property
    static public let constantDiameter = 139400000
    
    //Constant to pass the distance enter a planet to sun to a number between 0 and 20 to apply SCNVector3 to distance
    static public let constantDistanceEarthtoSun = 224900000
    
    static public let distanceAPlanetToSun = [75.2, 84.531, 116.874, 0.3, 178.05, 608.202, 116.405, 2242.98, 3474.9]
    
    //Equivalent a moon speed 0.0001
    static public let turningSpeed = [4.69, 2.45, 2.91, -0.0001, 2.36, 1.28, 0.67, 0.663, 0.531]
    
    static public let imagesNames = ["mercurio.jpg", "venus.jpg", "earth.jpg", "luna.jpg", "marte.jpg", "jupiter.jpg", "saturno.jpg", "urano.jpg", "neptuno.jpg"]
    
}
