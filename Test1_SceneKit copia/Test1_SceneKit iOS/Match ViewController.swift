//
//  Match ViewController.swift
//  Test1_SceneKit iOS
//
//  Created by Mario De Sio on 23/08/2019.
//  Copyright © 2019 Gennaro Giaquinto. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class Match_ViewController: UIViewController {
    let session = SessionManager.share
    let CANZONE_DEL_SOLE = "La canzone del sole"
    let CANZONE_KNOCK = "Knock in on heavens door"
    
    @IBAction func playButton(_ sender: Any) {
        let song: Songs?
        switch songLabel.text {
        case CANZONE_DEL_SOLE:
            song  = Songs.LaCanzoneDelSole
        case CANZONE_KNOCK:
            song = Songs.KnockinOnHeavensDoor
        default:
            print("Nessuna canzone selezionata")
            song = nil
        }
        if let device = session.showConnectedDevices(){
            if song != nil {
                session.sendSignal(device[0], song: song!)
            }
        }
    }
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var gamertagLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        innerView.layer.cornerRadius = 14
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
