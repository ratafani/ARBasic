//
//  ViewController.swift
//  ARBasic
//
//  Created by Muhammad Tafani Rabbani on 28/08/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var mScene: ARSCNView!
    
    let config = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mScene.debugOptions = [ARSCNDebugOptions.showWorldOrigin,ARSCNDebugOptions.showFeaturePoints]
        mScene.session.run(config)
        addNode()
        // Do any additional setup after loading the view.
    }
    
    func addNode(){
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
        node.position = SCNVector3(x: 0, y: 0, z: -0.3)
        
        mScene.scene.rootNode.addChildNode(node)
    }

    func resetScene(){
        mScene.session.pause()
        mScene.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        mScene.session.run(config, options: [.resetTracking,.removeExistingAnchors])
    }

    @IBAction func resetBtn(_ sender: Any) {
        resetScene()
        addNode()
    }
}

