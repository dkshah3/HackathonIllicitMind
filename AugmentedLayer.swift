
import Foundation
import UIKit

class AugmentedLayer: UIView {
    
    var manager : TransformationManager? = nil;
    var viewArray = Array<UIView>();
    var posArray = Array<Vec3D>();
    
    func _uglyInit() {
        let bounds : CGRect = UIScreen.main.bounds
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 150))
        testView.backgroundColor = UIColor.clear;
        let text = Message(frame: CGRect(x: -50, y: 100, width: bounds.size.width, height: 80));
        text.textLabel.text = "Subway Help";
        text.clipsToBounds = true;
        text.callbackFunction = {
            _ in
            text.textLabel.text = "Buy a Metro Pass here. Fill Pass with money, Swipe pass through gate."
            //text.textLabel.text = "Fill pass with money. Swipe pass through gate."
            text.textLabel.numberOfLines = 2
            text.textLabel.lineBreakMode = .byWordWrapping
            text.textLabel.frame.size.width = 400;
            text.frame.size.width = 400;
        }
        testView.transform = CGAffineTransform(rotationAngle: (CGFloat)(Double.pi/2));
        testView.addSubview(text);
        let testPoint = Vec3D(x: 3, y: 0, z: 0);
        self.viewArray.append(testView);
        self.posArray.append(testPoint);
        self.addSubview(testView);
        
        
        let bounds2 : CGRect = UIScreen.main.bounds
        let testView2 = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 150))
        testView.backgroundColor = UIColor.clear;
        let text2 = Message(frame: CGRect(x: -50, y: 100, width: bounds.size.width, height: 80));
        text.textLabel.text = "Starbucks Tip";
        text.clipsToBounds = true;
        text.callbackFunction = {
            _ in
            text.textLabel.text = "You can buy great chai here."
            //text.textLabel.text = "Fill pass with money. Swipe pass through gate."
            text.textLabel.numberOfLines = 2
            text.textLabel.lineBreakMode = .byWordWrapping
            text.textLabel.frame.size.width = 400;
            text.frame.size.width = 400;
        }
        testView.transform = CGAffineTransform(rotationAngle: (CGFloat)(Double.pi/2));
        testView.addSubview(text);
        let testPoint2 = Vec3D(x: 4, y: 5, z: 0);
        self.viewArray.append(testView);
        self.posArray.append(testPoint);
        self.addSubview(testView);
        
        let bounds3 : CGRect = UIScreen.main.bounds
        let testView3 = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 150))
        testView.backgroundColor = UIColor.clear;
        let text3 = Message(frame: CGRect(x: -50, y: 100, width: bounds.size.width, height: 80));
        text.textLabel.text = "Food Tip";
        text.clipsToBounds = true;
        text.callbackFunction = {
            _ in
            text.textLabel.text = "You can buy Halal here."
            //text.textLabel.text = "Fill pass with money. Swipe pass through gate."
            text.textLabel.numberOfLines = 2
            text.textLabel.lineBreakMode = .byWordWrapping
            text.textLabel.frame.size.width = 400;
            text.frame.size.width = 400;
        }
        testView.transform = CGAffineTransform(rotationAngle: (CGFloat)(Double.pi/2));
        testView.addSubview(text);
        let testPoint3 = Vec3D(x: 6, y: 2, z: 0);
        self.viewArray.append(testView);
        self.posArray.append(testPoint);
        self.addSubview(testView);
        
        
        
        
        
        
        
        
        
                
                //self.addSubview(testView4);
        
        
        self.manager = TransformationManager();
        self.manager?.trackPoints.append(testPoint);
        self.manager?.trackPoints.append(testPoint2);
        self.manager?.trackPoints.append(testPoint3);
        self.manager?.trackDots.append(Vec2D());
        self.manager?.trackDots.append(Vec2D());
        self.manager?.trackDots.append(Vec2D());
        self.manager?.augLayer = self;
//        for v in self.viewArray {
//            self.addSubview(v);
//        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.bounds = self.frame;
        _uglyInit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.bounds = self.frame;
        _uglyInit();
    }
    
    func update(manager: TransformationManager) {
        var i = 0;
        for p in manager.trackDots {
            let p = p as Vec2D;
            self.viewArray[i].frame.origin.x = CGFloat(p.i) * self.frame.height * 0.5 + self.frame.width * 0.5;
            self.viewArray[i].frame.origin.y = CGFloat(p.j) * self.frame.height * 0.5 + self.frame.height * 0.5;
            i += 1;
        }
    }
}
