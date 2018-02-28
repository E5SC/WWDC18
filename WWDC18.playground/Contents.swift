//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let mainView = UIView(frame: CGRect(x: 0, y: 50, width: 800, height: 500))
let startView = UIView(frame: CGRect(x: 0, y: 50, width: 800, height: 500))
let homeView = UIView(frame: CGRect(x: 0, y: 50, width: 800, height: 500))

let playBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
let menuButton = UIButton(frame: CGRect(x: -1*(mainView.frame.width), y: mainView.frame.height, width: 20, height: 20))

let swipe = UISwipeGestureRecognizer()

var start = true

public class Responder{
    
    @objc public func play(){
        start = false
        UIView.setAnimationTransition(UIViewAnimationTransition.flipFromRight, for: startView, cache: false)
        playBtn.removeFromSuperview()
        startView.removeFromSuperview()
        mainView.addSubview(homeView)
    }
    
    @objc public func openMenu(){
        
    }
    
    
}

let respond = Responder()

swipe.addTarget(respond, action: #selector(respond.openMenu))
swipe.direction = UISwipeGestureRecognizerDirection.right

menuButton.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
menuButton.imageView?.contentMode = .scaleAspectFit
menuButton.addTarget(respond, action: #selector(respond.openMenu), for: .touchUpInside)
homeView.addSubview(menuButton)

playBtn.setImage(UIImage(named: "playBtn.png"), for: UIControlState.normal)
playBtn.imageView?.contentMode = .scaleAspectFit
playBtn.addTarget(respond, action: #selector(respond.play), for: .touchUpInside)
startView.addSubview(playBtn)

startView.backgroundColor = UIColor.black
homeView.backgroundColor = UIColor.black
mainView.backgroundColor = UIColor.black
mainView.addSubview(startView)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = mainView
