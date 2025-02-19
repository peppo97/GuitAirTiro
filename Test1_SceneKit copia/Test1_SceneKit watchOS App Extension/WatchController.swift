//
//  WatchController.swift
//  GuitAir WatchKit Extension
//
//  Created by Gennaro Giaquinto on 16/07/2019.
//  Copyright © 2019 Gennaro Giaquinto. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class WatchController: WKInterfaceController, MotionManagerDelegate {
    let session = WCSession.default
    var connectionStatus: Bool = false
    var sessionStatus: WCSessionActivationState {
        get {
            return session.activationState
        }
    }
    var isFirstAppearance = true
    
    @IBOutlet weak var stateLabel: WKInterfaceLabel!
    
    var manager = MotionManager()
    
    func updatedRead(sound: Bool) {
        sendData()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        manager.delegate = self
        
        WKExtension.shared().isAutorotating = true
        WKExtension.shared().isFrontmostTimeoutExtended = true
        
        if WCSession.isSupported() {
//            print("Sono nella willActivate")
            session.delegate = self
            session.activate()
        }
        sleep(2)
//        connectionStatus = checkConnection()
        self.setTitle("")
        
        if isFirstAppearance{
            if session.isReachable{
                if stateLabel != nil {
                    stateLabel.setText("Connected to the iPhone!\nReady to play.")
                }
            }
            else{
                if stateLabel != nil {
                    stateLabel.setText("iPhone is unreachable!")
                }
            }
            isFirstAppearance = false
        }
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
//        if manager.motionManager.isDeviceMotionActive {
//            manager.stopUpdates()
//            dismiss()
//        }
        super.didDeactivate()
    }
    
    

}

extension WatchController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        /*
        if activationState == WCSessionActivationState.activated{
            stateLabel.setText("Connected to the iPhone!\nReady to play")
        }
        else{
            stateLabel.setText("Can't connect to the iPhone!")
        }
 */
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if message["payload"] as! String == "start" {
            manager.startUpdates()
            DispatchQueue.main.async {
                self.presentController(withName: "playingScene", context: nil)
            }
        }
        else if message["payload"] as! String == "stop" {
            manager.stopUpdates()
            DispatchQueue.main.async {
                self.dismiss()
            }
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        if session.isReachable{
            DispatchQueue.main.async {
                if self.stateLabel != nil{
                    self.stateLabel.setText("Connected to the iPhone!\nReady to play")
                }
            }
        }
        else{
            if manager.motionManager.isDeviceMotionActive {
                manager.stopUpdates()
                DispatchQueue.main.async {
                    self.dismiss()
                }
            }
            DispatchQueue.main.async {
                if self.stateLabel != nil {
                    self.stateLabel.setText("iPhone is unreachable!")
                }
            }
        }
    }
    
}

extension WatchController {
//    func checkConnection() -> Bool{
//        guard self.sessionStatus == WCSessionActivationState.activated else {
//            stateLabel.setText("Connection not available")
//            return false
//        }
//        guard self.session.isReachable else {
//            if  self.session.iOSDeviceNeedsUnlockAfterRebootForReachability {
//                stateLabel.setText("iPhone not reacheable!")
//            }
//            return false
//        }
//        return true
//    }
    
    func sendData() {
        session.sendMessage(["payload": "1"], replyHandler: nil)
    }
}
