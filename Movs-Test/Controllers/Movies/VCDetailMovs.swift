//
//  VCDetailMovs.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 04-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class VCDetailMovs: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var LblTitle: UILabel!
    @IBOutlet weak var LblYear: UILabel!
    @IBOutlet weak var LblGenero: UILabel!
    @IBOutlet weak var LblDescrip: UILabel!
    
    var imageString:String!
    var nameString:String!
    var yearString:String!
    var generoString:String!
    var decripString:String!
    
    var  votecount: Int32!
    var  id: Int32!
    var  video: Bool!
    var  voteaverage: Double!
    var  popularity: Double!
    var  posterpath: String!
    var  originallanguage: String!
    var  originaltitle: String!
    var  backdroppath: String!
    var  adult: Bool!
    var  overview: String!
    var  releasedate: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func updateUI() {
        self.LblTitle.text = nameString
        self.LblYear.text = yearString
        self.LblGenero.text = generoString
        self.LblDescrip.text = decripString
        self.LblDescrip.numberOfLines = 12
        self.LblDescrip.lineBreakMode = .byWordWrapping
        let imgURL = URL(string:imageString)
        let data = NSData(contentsOf: (imgURL)!)
        self.imageView.image = UIImage(data: data as! Data)
    }
    func GoToActionFavorite()
    {
        if ( MovFavoriteCore().saveDataToCoreData(
            votecount: Int(votecount),
            id: Int(id),
            video: video,
            voteaverage: voteaverage,
            title: nameString,
            popularity: popularity,
            posterpath: posterpath,
            originallanguage: originallanguage,
            originaltitle: originaltitle,
            backdroppath: backdroppath,
            adult: adult,
            overview: overview,
            releasedate: releasedate) == true )
        {}else{
            
        }
    }
    func goDeteleItem(id: Int)
    {
        CoreDataManager.deleteItemCore(withID: Int32(id))
    }
    
}
