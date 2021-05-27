import UIKit
import SpriteKit

class Camera: SKCameraNode, UIGestureRecognizerDelegate {
    
    // MARK: Properties
    
    // MARK: Main Varibles
    
    // camera node
    let scenario: SKNode
    
    // device limits
    private var screenLimits: CGRect
    
    // scene limits
    private var scenarioFrame: CGRect
    
    // enable/disable camera
    var enableCamera: Bool {
        didSet {
            // enable/disable gesture
            pinchGestureRecognizer.isEnabled = enableCamera
            
        }
    }
    
    // blocks/unblocks camera
    var enableLock: Bool
    
    // MARK: Zoom in/out
    
    // current camera zoom
    private var zoomScale: CGFloat
    
    // min and max possible zoom
    var zoomInterval: (min: CGFloat, max: CGFloat)
    
    // enable/disable camera zoom
    var enableZoom: Bool
    
    // zoom camera gesture
    var pinchGestureRecognizer: UIPinchGestureRecognizer!
    
    // last touches position
    private var initialTouchPosition = CGPoint.zero
    
    // MARK: Navigation
    
    // gesture for navigating through the camera
    private var swipeNavigation: UIPanGestureRecognizer {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.updatePosition(_:)))
        panGesture.maximumNumberOfTouches = 1
        return panGesture
    }
    
    // location of the last screen touch
    private var lastTouchPosition: CGPoint!
    
    init(sceneView: SKView, scenario: SKNode) {
        //initial camera config
        self.scenario = scenario
        self.scenarioFrame = scenario.frame
        let myBounds = CGRect(x: 0, y: 0, width: sceneView.bounds.width/2, height: sceneView.bounds.height/2)
        self.screenLimits = myBounds
        
        // determines initial zoom sacle for 1
        zoomScale = 1
        // determines zoom interval
        zoomInterval = (0.1, 1.0)
        //enavles zoom
        enableZoom = true
        enableCamera = true
        // locks camera when trying to leave the scenario
        enableLock = true
        super.init()
        
        // add gesture to the view
        pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.updateScale(_:)))
        
        pinchGestureRecognizer.delegate = self
        swipeNavigation.delegate = self
        
        sceneView.addGestureRecognizer(pinchGestureRecognizer)
        
        sceneView.addGestureRecognizer(swipeNavigation)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Scale and Zoom
    
    // zoom scale
    func applyZoomScale(scale: CGFloat) {
        
        var zoomScale = scale
        
        if zoomScale < zoomInterval.min {
            zoomScale = zoomInterval.min
        } else if zoomScale > zoomInterval.max {
            zoomScale = zoomInterval.max
        }
        
        self.zoomScale = zoomScale
        scenario.setScale(zoomScale)
    }
    
    
    // MARK: Bounds
    
    // mantains scene limits
    public func clampWorldNode() {
        
        // for the scene limits to mantain this variable needs to be true
        if !enableLock { return }
        
        // Calculates screen limits
        
        
        let frame = scenarioFrame
        var minX = frame.minX + 1750
        var maxX = frame.maxX - 1800
        var minY = frame.minY + 1550
        var maxY = frame.maxY - 1250
        
        
        // Verifies if the scene size is bigger than the view size in case needs change
        if frame.width < screenLimits.width {
            swap(&minX, &maxX)
        }
        
        if frame.height < screenLimits.height {
            swap(&minY, &maxY)
        }
        
        // Verifies if user is at the limits
        if position.x < minX {
            position.x = CGFloat(Int(minX))
        } else if position.x > maxX {
            position.x = CGFloat(Int(maxX))
        }
        
        if position.y < minY {
            position.y = CGFloat(Int(minY))
        } else if position.y > maxY {
            position.y = CGFloat(Int(maxY))
        }
        
    }
    
    // MARK: Positioning
    
    // Moves acmera cheking limits
    func centerOnPosition(scenePosition: CGPoint) {
        // Verifies if the scales are in the right parameters
        if (zoomScale > zoomInterval.min && zoomScale < zoomInterval.max) || lastTouchPosition != nil {
            position = scenePosition
            clampWorldNode()
        }
        
    }
    
    // MARK: Input
    
    // Scales scenario with pinchGesture
        @objc func updateScale(_ recognizer: UIPinchGestureRecognizer) {
    
            guard let scene = self.scene else { return }
    
            // Calculates user's first touch
            if recognizer.state == .began {
                initialTouchPosition = scene.convertPoint(fromView: recognizer.location(in: recognizer.view))
    
            }
            
            // Calculates zoom and applies it in the scenario then centers camera
            if recognizer.state == .changed && enableCamera && enableZoom {
    
                zoomScale *= recognizer.scale
                applyZoomScale(scale: zoomScale)
                recognizer.scale = 1
                // centerOnPosition(scenePosition: CGPoint(x: initialTouchPosition.x * zoomScale, y: initialTouchPosition.y * zoomScale))
            }
    
            if recognizer.state == .ended { }
        }
    
    // MARK: Screen Navigation
    
    // Moves camera thtough the scenario
    @objc func updatePosition(_ recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            // Saves initial touch position
            lastTouchPosition = recognizer.location(in: recognizer.view)
        }
        
        if recognizer.state == .changed {
            
            if lastTouchPosition == nil { return }
            
            let location = recognizer.location(in: recognizer.view)
            // Calculates the Δx and Δy 
            let difference = CGPoint(x: location.x - lastTouchPosition.x, y: location.y - lastTouchPosition.y)
            // Limits user area
            centerOnPosition(scenePosition: CGPoint(x: Int(position.x - difference.x), y: Int(position.y - -difference.y)))
            lastTouchPosition = location
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
