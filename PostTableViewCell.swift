//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 小田倉真弘 on 2017/10/03.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell{
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var postArray: [PostData] = []
    
    var comments:String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        //commentsをcaptionの中に改行しながら追加する(yet)lesson3for文を参考に
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        
        
        for comment in postData.comments {
            print(comment)
            self.captionLabel.text="\(self.captionLabel.text!)\n\(comment)"
        }
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
    }
    @IBOutlet weak var commentsButton: UIButton!
    
}
