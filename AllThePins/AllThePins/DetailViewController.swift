//
//  DetailViewController.swift
//  AllThePins
//
//  Created by Kai Cherry on 3/19/19.
//  Copyright © 2019 RnSKSoft. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var tableName: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
    @IBOutlet weak var tableURLLabel: UILabel!
    @IBOutlet weak var tableDateLabel: UILabel!
    @IBOutlet weak var tableAuthorLabel: UILabel!
    @IBOutlet weak var tableVersionLabel: UILabel!
    
    @IBOutlet weak var backglassURLabel: UILabel!
    @IBOutlet weak var backglassDateLabel: UILabel!
    @IBOutlet weak var backglassVersionLabel: UILabel!
    @IBOutlet weak var backglassAuthorLabel: UILabel!
    
    @IBOutlet weak var romURLLabel: UILabel!
    @IBOutlet weak var romDateLabel: UILabel!
    @IBOutlet weak var romVersionLabel: UILabel!
    @IBOutlet weak var romNameLabel: UILabel!
    
    @IBOutlet weak var backglassImageView: UIImageView!
    @IBOutlet weak var playfieldImageView: UIImageView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var youTubePlayer: WKYTPlayerView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
            self.navigationItem.title = detail.tableName
           
            if let tableUrl = tableURLLabel, let tableDate = tableDateLabel, let tName = tableName, let year = releaseYear, let tableVersion = tableVersionLabel, let tableAuthors = tableAuthorLabel {
                
                tableUrl.text = detail.cabinet.table.url ?? "Not Available"
                tableDate.text = detail.cabinet.table.date
                tName.text = detail.tableName
                tableVersion.text = detail.cabinet.table.version
                tableAuthors.text = detail.cabinet.table.authors ?? ""
                year.text = detail.ipdbInfo.year == "" ?  detail.cabinet.table.date : detail.ipdbInfo.year
            }
          
            
           
            if let backURL = backglassURLabel, let backDate = backglassDateLabel, let backVersion = backglassVersionLabel, let backAuthors = backglassAuthorLabel {
                backURL.text = detail.cabinet.backglass.url ?? "Not Available"
                backDate.text = detail.cabinet.backglass.date
                backVersion.text = detail.cabinet.backglass.version
                backAuthors.text = detail.cabinet.backglass.authors ?? ""
                
            }
            
            if let romURL = romURLLabel, let romDate = romDateLabel, let romName = romNameLabel, let romVersion = romVersionLabel {
                romURL.text = detail.cabinet.rom?.url ?? "Not Available"
                romDate.text = detail.cabinet.rom?.date
                romName.text = detail.cabinet.rom?.name
                romVersion.text = detail.cabinet.rom?.version
            }
            
            if let playfieldImage = UIImage(named: "\(detail.tableName).png"), let playfieldView = playfieldImageView, let backView = backGroundImageView {
                playfieldView.image = playfieldImage
                backView.image = playfieldImage
            }
            
            if let youTube = youTubePlayer {
               youTube.load(withVideoId: "2Txd5x3QWCY")
               
                youTube.playVideo()
            }
            
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureView()
        
        UIView.animate(withDuration: 30, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.backGroundImageView.frame = self.view.frame
        }, completion: nil)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    var detailItem: VPinTable? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

