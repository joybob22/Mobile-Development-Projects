import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView





let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple

liveView.addSubview(square)




//UIView.animate(withDuration: 3.0) {
//    square.backgroundColor = .blue
//}


//UIView.animate(withDuration: 3.0) {
//    square.backgroundColor = .red
//    square.center = liveView.center
//} completion: { _ in
//    UIView.animate(withDuration: 3.0) {
//        square.backgroundColor = .purple
//        square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//    }
//}


//
//UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat]) {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
//} completion: { _ in
//
//}



//UIView.animate(withDuration: 1.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: []) {
//    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
//} completion: { _ in
//
//}

UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .curveLinear]) {

    
    
    let rotateTransform = CGAffineTransform(rotationAngle: -(CGFloat.pi * 0.999))
    
    
    square.transform = rotateTransform
} completion: { _ in
    
}



//
//UIView.animate(withDuration: 3.0) {
//    square.backgroundColor = .red
//
//    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//    let rotateTransform = CGAffineTransform(rotationAngle: -(CGFloat.pi * 0.999))
//    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
//    let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
//
//    square.transform = comboTransform
//} completion: { _ in
//    UIView.animate(withDuration: 3.0) {
//        square.transform = CGAffineTransform.identity
//        square.backgroundColor = .purple
//    }
//}




