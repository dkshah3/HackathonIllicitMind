

import UIKit
import CoreLocation

class ViewController: UIViewController{
    var AGL : AugmentedLayer? = nil;
    var camycam : CameraOverlay? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.AGL = AugmentedLayer(frame: self.view.frame);
        self.camycam = CameraOverlay(frame: self.view.frame);
        self.view.addSubview(self.camycam!);
        self.view.addSubview(self.AGL!);
        //self.view.sendSubview(toBack: self.camycam!);
        //Cool Story Bro.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
}

