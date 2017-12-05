
//
//  PlaneNode.swift
//  ARKitSample
//
//  Created by Shinya Yamamoto on 2017/11/24.
//  Copyright © 2017年 shinyayamamoto. All rights reserved.
//

import SceneKit
import ARKit

class PlaneNode: SCNNode {
    
    init(anchor: ARPlaneAnchor) {
        super.init()
        geometry = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        let planeMaterial = SCNMaterial()
        planeMaterial.diffuse.contents = UIColor.red.withAlphaComponent(0.5)
        geometry?.materials = [planeMaterial]
        SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(anchor: ARPlaneAnchor) {
        (geometry as! SCNPlane).width = CGFloat(anchor.extent.x)
        (geometry as! SCNPlane).height = CGFloat(anchor.extent.z)
        position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
    }
    
}
