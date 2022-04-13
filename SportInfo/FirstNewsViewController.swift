//
//  FirstNewsViewController.swift
//  SportInfo
//
//  Created by viktor on 13.04.2022.
//

import UIKit
 
var article: Article!

class FirstNewsViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var LabelTitle: UILabel!
    @IBOutlet var LabelDescription: UILabel!
    @IBAction func PushAction(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelTitle.text = article.title
        LabelDescription.text = article.description
        
        ImageView.image = UIImage(data: try! Data(contentsOf: URL(string: article.url)!))
        

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
