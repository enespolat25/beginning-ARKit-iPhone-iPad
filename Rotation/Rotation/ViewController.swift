//
//  ViewController.swift
//  Rotation
//
//  Created by Wallace Wang on 7/25/18.
//  Copyright © 2018 Wallace Wang. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import GLKit

class ViewController: UIViewController, ARSCNViewDelegate  {

    @IBOutlet var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    let node = SCNNode()
    
    var currentX : Float = 0
    var currentY : Float = 0
    var currentZ : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        showShape()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sceneView.session.run(configuration)
    }

    func showShape() {
        let pyramid = SCNPyramid(width: 0.05, height: 0.1, length: 0.05)
        pyramid.firstMaterial?.diffuse.contents = UIColor.green
        
        node.geometry = pyramid
        node.position = SCNVector3(0.05, 0.05, -0.05)
        sceneView.scene.rootNode.addChildNode(node)
    }

    @IBAction func XChanged(_ sender: UISlider) {
        currentX = GLKMathDegreesToRadians(sender.value)
        node.eulerAngles = SCNVector3(currentX, currentY, currentZ)
    }
    
    @IBAction func YChanged(_ sender: UISlider) {
        currentY = GLKMathDegreesToRadians(sender.value)
        node.eulerAngles = SCNVector3(currentX, currentY, currentZ)
    }
    
    @IBAction func ZChanged(_ sender: UISlider) {
        currentZ = GLKMathDegreesToRadians(sender.value)
        node.eulerAngles = SCNVector3(currentX, currentY, currentZ)
    }
    
}

