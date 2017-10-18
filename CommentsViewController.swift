//
//  CommentsViewController.swift
//
//
//  Created by 小田倉真弘 on 2017/10/07.
//
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class CommentsViewController: UIViewController {
    
    var postData:PostData!

    @IBOutlet weak var commentsTextField: UITextField!
    
    @IBAction func commentsButton(_ sender: Any){
        //増えたcommentsをFirebaseに追加する
        let name = Auth.auth().currentUser?.displayName

        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        var comments = postData.comments
        comments.append("\(name!) : \(commentsTextField.text!)")
        let updateComments = ["comments": comments]
        postRef.updateChildValues(updateComments)
        self.dismiss(animated: true, completion: nil)
        

       
                   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let postTableViewCell:PostTableViewCell = segue.destination as! PostTableViewCell
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

