//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import SceneKit
import AVFoundation

let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
let menuButton = UIButton(frame: CGRect(x: 10, y: 10, width: 25, height: 25))

public class Responder{
    
    public let view = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
    var player: AVAudioPlayer!
    let earthName = Bundle.main.url(forResource: "Earth.mp3", withExtension: "mp3")
    let jupiterName = Bundle.main.url(forResource: "Jupiter.mp3", withExtension: "mp3")
    let marsName = Bundle.main.url(forResource: "Mars.mp3", withExtension: "mp3")
    let mercuryName = Bundle.main.url(forResource: "Mercury.mp3", withExtension: "mp3")
    let neptuneName = Bundle.main.url(forResource: "Neptune.mp3", withExtension: "mp3")
    let saturnName = Bundle.main.url(forResource: "Saturn.mp3", withExtension: "mp3")
    let uranusName = Bundle.main.url(forResource: "Uranus.mp3", withExtension: "mp3")
    let venusName = Bundle.main.url(forResource: "Venus.mp3", withExtension: "mp3")
    
    let images = Constants.imagesNames
    let names = Constants.names
    let dSol = Constants.diameterSun
    let distance = Constants.distanceAPlanetToSun
    let rotationSpeed = Constants.turningSpeed
    let angleRotation = Constants.inclination

    @objc public func openMenu(){
        
    }
    
    @objc public func createdSolarSystemView(){
        let scene = SCNScene()
        view.scene = scene
        scene.background.contents = UIImage(named: "space.jpg")
        view.allowsCameraControl = true
        
        let camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3(x: 0, y: 0, z: 3600)
        camera.camera?.zFar = 5000
        camera.camera?.zNear = 0.5
        camera.camera?.automaticallyAdjustsZRange = true
        
        scene.rootNode.addChildNode(camera)
        
        let light1 = SCNNode()
        light1.light = SCNLight()
        light1.light?.type = .probe
        light1.position = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(light1)
        
        //SUN NODE
        var solGeometry: SCNGeometry!
        solGeometry = SCNSphere(radius: 50)
        solGeometry.firstMaterial?.diffuse.contents = UIImage(named: "sol.jpg")
        let solNode = SCNNode(geometry: solGeometry)
        solNode.position = SCNVector3(x:0, y:0, z:0)
        scene.rootNode.addChildNode(solNode)
        
        //MERCURY NODE
        var mercuryNode: SCNNode!
        let mercuryOrbitNode = SCNNode(geometry: SCNSphere(radius: 2))
        solNode.addChildNode(mercuryOrbitNode)
        let angle1 = (angleRotation[0] * Double.pi) / 180
        let action1 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[0]), z: 0, duration: 5)
        let action11 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle1)), duration: 6)
        let repeat11 = SCNAction.repeatForever(action11)
        let repeat1 = SCNAction.repeatForever(action1)
        let sqc1: SCNAction = SCNAction.sequence([repeat1, repeat11])
        mercuryOrbitNode.runAction(sqc1)
        let moonGeo = SCNSphere(radius: 5)
        moonGeo.firstMaterial?.diffuse.contents = UIImage(named: "mercurio.jpg")
        mercuryNode = SCNNode(geometry: moonGeo)
        mercuryOrbitNode.addChildNode(mercuryNode)
        mercuryNode.position = SCNVector3(0, 0, CGFloat(distance[0]))
        
        //VENUS NODE
        var venusNode: SCNNode!
        let venusOrbitNode = SCNNode(geometry: SCNSphere(radius: 5))
        solNode.addChildNode(venusOrbitNode)
        let angle2 = (angleRotation[1] * Double.pi) / 180
        let action2 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[1]), z: 0, duration: 5)
        let action22 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle2)), duration: 6)
        let repeat22 = SCNAction.repeatForever(action22)
        let repeat2 = SCNAction.repeatForever(action2)
        let sqc2: SCNAction = SCNAction.sequence([repeat2, repeat22])
        venusOrbitNode.runAction(sqc2)
        let venusGeo = SCNSphere(radius: 10)
        venusGeo.firstMaterial?.diffuse.contents = UIImage(named: "venus.jpg")
        venusNode = SCNNode(geometry: venusGeo)
        venusOrbitNode.addChildNode(venusNode)
        venusNode.position = SCNVector3(0, 0, CGFloat(distance[1]))
        
        //EARTH NODE
        var earthNode: SCNNode!
        let earthOrbitNode = SCNNode(geometry: SCNSphere(radius: 8))
        solNode.addChildNode(earthOrbitNode)
        let angle3 = (angleRotation[2] * Double.pi) / 180
        let action3 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[2]), z: 0, duration: 5)
        let action33 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle3)), duration: 6)
        let repeat33 = SCNAction.repeatForever(action33)
        let repeat3 = SCNAction.repeatForever(action3)
        let sqc3: SCNAction = SCNAction.sequence([repeat3, repeat33])
        earthOrbitNode.runAction(sqc3)
        let earthGeo = SCNSphere(radius: 10)
        earthGeo.firstMaterial?.diffuse.contents = UIImage(named: "earth.jpg")
        earthNode = SCNNode(geometry: earthGeo)
        earthOrbitNode.addChildNode(earthNode)
        earthNode.position = SCNVector3(0, 0, CGFloat(distance[2]))
        
        //LUNA NODE
        var moonNode: SCNNode!
        let moonOrbitNode = SCNNode(geometry: SCNSphere(radius: 1))
        earthNode.addChildNode(moonOrbitNode)
        let angle4 = (angleRotation[3] * Double.pi) / 180
        let action4 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[3]), z: 0, duration: 5)
        let action44 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle4)), duration: 6)
        let repeat44 = SCNAction.repeatForever(action44)
        let repeat4 = SCNAction.repeatForever(action4)
        let sqc4: SCNAction = SCNAction.sequence([repeat4, repeat44])
        moonOrbitNode.runAction(sqc4)
        let moonGeo2 = SCNSphere(radius: 5)
        moonGeo2.firstMaterial?.diffuse.contents = UIImage(named: "luna.jpg")
        moonNode = SCNNode(geometry: moonGeo2)
        moonOrbitNode.addChildNode(moonNode)
        moonNode.position = SCNVector3(0, 0, CGFloat(distance[3]))
        
        //MARTES NODE
        var martesNode: SCNNode!
        let martesOrbitNode = SCNNode(geometry: SCNSphere(radius: 5))
        solNode.addChildNode(martesOrbitNode)
        let angle5 = (angleRotation[4] * Double.pi) / 180
        let action5 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[4]), z: 0, duration: 5)
        let action55 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle5)), duration: 6)
        let repeat55 = SCNAction.repeatForever(action55)
        let repeat5 = SCNAction.repeatForever(action5)
        let sqc5: SCNAction = SCNAction.sequence([repeat5, repeat55])
        martesOrbitNode.runAction(sqc5)
        let martesGeo = SCNSphere(radius: 10)
        martesGeo.firstMaterial?.diffuse.contents = UIImage(named: "marte.jpg")
        martesNode = SCNNode(geometry: martesGeo)
        martesOrbitNode.addChildNode(martesNode)
        martesNode.position = SCNVector3(0, 0, CGFloat(distance[4]))
        
        //JUPITER NODE
        var jupiterNode: SCNNode!
        let jupiterOrbitNode = SCNNode(geometry: SCNSphere(radius: 30))
        solNode.addChildNode(jupiterOrbitNode)
        let angle6 = (angleRotation[5] * Double.pi) / 180
        let action6 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[5]), z: 0, duration: 5)
        let action66 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle6)), duration: 6)
        let repeat66 = SCNAction.repeatForever(action66)
        let repeat6 = SCNAction.repeatForever(action6)
        let sqc6: SCNAction = SCNAction.sequence([repeat6, repeat66])
        jupiterOrbitNode.runAction(sqc6)
        let jupiterGeo = SCNSphere(radius: 10)
        jupiterGeo.firstMaterial?.diffuse.contents = UIImage(named: "jupiter.jpg")
        jupiterNode = SCNNode(geometry: jupiterGeo)
        jupiterOrbitNode.addChildNode(jupiterNode)
        jupiterNode.position = SCNVector3(0, 0, CGFloat(distance[5]))
        
        //SATURNO NODE
        var saturnoNode: SCNNode!
        let saturnoOrbitNode = SCNNode(geometry: SCNSphere(radius: 20))
        solNode.addChildNode(saturnoOrbitNode)
        let angle7 = (angleRotation[6] * Double.pi) / 180
        let action7 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[6]), z: 0, duration: 5)
        let action77 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle7)), duration: 6)
        let repeat77 = SCNAction.repeatForever(action77)
        let repeat7 = SCNAction.repeatForever(action7)
        let sqc7: SCNAction = SCNAction.sequence([repeat7, repeat77])
        saturnoOrbitNode.runAction(sqc7)
        let saturnoGeo = SCNSphere(radius: 10)
        saturnoGeo.firstMaterial?.diffuse.contents = UIImage(named: "saturno.jpg")
        saturnoNode = SCNNode(geometry: saturnoGeo)
        saturnoOrbitNode.addChildNode(saturnoNode)
        saturnoNode.position = SCNVector3(0, 0, CGFloat(distance[6]))
        
        //URANO NODE
        var uranoNode: SCNNode!
        let uranoOrbitNode = SCNNode(geometry: SCNSphere(radius: 15))
        solNode.addChildNode(uranoOrbitNode)
        let angle8 = (angleRotation[7] * Double.pi) / 180
        let action8 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[7]), z: 0, duration: 5)
        let action88 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle8)), duration: 6)
        let repeat88 = SCNAction.repeatForever(action88)
        let repeat8 = SCNAction.repeatForever(action8)
        let sqc8: SCNAction = SCNAction.sequence([repeat8, repeat88])
        uranoOrbitNode.runAction(sqc8)
        let uranoGeo = SCNSphere(radius: 10)
        uranoGeo.firstMaterial?.diffuse.contents = UIImage(named: "urano.jpg")
        uranoNode = SCNNode(geometry: uranoGeo)
        uranoOrbitNode.addChildNode(uranoNode)
        uranoNode.position = SCNVector3(0, 0, CGFloat(distance[7]))
        
        //NEPTUNO NODE
        var neptunoNode: SCNNode!
        let neptunoOrbitNode = SCNNode(geometry: SCNSphere(radius: 12))
        solNode.addChildNode(neptunoOrbitNode)
        let angle9 = (angleRotation[8] * Double.pi) / 180
        let action9 = SCNAction.rotateBy(x: 0, y: CGFloat(rotationSpeed[8]), z: 0, duration: 5)
        let action99 = SCNAction.rotate(toAxisAngle: SCNVector4(0.0, 0.0, 0.0, Float(angle9)), duration: 6)
        let repeat99 = SCNAction.repeatForever(action99)
        let repeat9 = SCNAction.repeatForever(action9)
        let sqc9: SCNAction = SCNAction.sequence([repeat9, repeat99])
        neptunoOrbitNode.runAction(sqc9)
        let neptunoGeo = SCNSphere(radius: 10)
        neptunoGeo.firstMaterial?.diffuse.contents = UIImage(named: "neptuno.jpg")
        neptunoNode = SCNNode(geometry: neptunoGeo)
        neptunoOrbitNode.addChildNode(neptunoNode)
        neptunoNode.position = SCNVector3(0, 0, CGFloat(distance[8]))
        mainView.addSubview(view)
        
    }
}

let classe = Responder()

menuButton.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
menuButton.imageView?.contentMode = .scaleAspectFit
menuButton.addTarget(classe, action: #selector(Responder.openMenu), for: .touchUpInside)

let borderColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
mainView.layer.borderColor = borderColor.cgColor
mainView.layer.borderWidth = 5
classe.createdSolarSystemView()
mainView.addSubview(classe.view)
mainView.addSubview(menuButton)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = mainView
