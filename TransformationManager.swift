
import Foundation
import CoreMotion

class TransformationManager {
    let motionManager : CMMotionManager = CMMotionManager();
    let transformOpQueue : OperationQueue = OperationQueue();
    
    var lastReadAttitude : CMAttitude? = nil;
    var deviceOrientationNormal : Vec3D = Vec3D();
    var deviceOrientationLandscape : Vec3D = Vec3D();
    var trackPoints : Array<Vec3D> = Array<Vec3D>();
    var trackDots : Array<Vec2D> = Array<Vec2D>();
    
    var augLayer : AugmentedLayer? = nil;
    
    init() {
        self.transformOpQueue.qualityOfService = .userInteractive;
        self.motionManager.deviceMotionUpdateInterval = TimeInterval(1 / 120);
        self.motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: self.transformOpQueue, withHandler: {
            data, error in
            self.lastReadAttitude = data?.attitude;
            self.deviceOrientationNormal = Vec3D(x: Float((data?.attitude.pitch)!), y: Float((data?.attitude.roll)!), z: Float((data?.attitude.yaw)!));
            self.deviceOrientationLandscape = Vec3D(x: self.deviceOrientationNormal.y, y: self.deviceOrientationNormal.x, z: self.deviceOrientationNormal.z);
        
            
            var i = 0;
            for v in self.trackPoints {
                var v = v as Vec3D;
                v = Vec3D.rotate(v: v, a: Vec3D.UnitVectorX, r: self.deviceOrientationNormal.x);
                v = Vec3D.rotate(v: v, a: Vec3D.UnitVectorY, r: self.deviceOrientationNormal.y);
                v = Vec3D.rotate(v: v, a: Vec3D.UnitVectorZ, r: -self.deviceOrientationNormal.z);
                self.trackDots[i] = v.projectionPlot(focalLength: Float(M_PI));
                i += 1;
            }
            if (self.augLayer != nil)
            {
                OperationQueue.main.addOperation {
                    self.augLayer?.update(manager: self);
                }
            }
        });
    }
}
