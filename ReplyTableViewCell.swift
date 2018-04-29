//
//  ReplyTableViewCell.swift
//  VariousViews
//
//  Created by Hayoung Park on 2018. 4. 29..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

struct Reply {
    var userName: String
    var content: String
    var likeCount: Int
    var dislikeCount: Int
}

class ReplyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bestLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var dislikeCountLabel: UILabel!
    
    @IBOutlet weak var contentLabelTopLayoutConstraint: NSLayoutConstraint!
    
    var reply: Reply? {
        didSet {
            guard let reply = reply else { return }
            
            userNameLabel.text = reply.userName
            contentLabel.text = reply.content
            likeCountLabel.text = "\(reply.likeCount)"
            dislikeCountLabel.text = "\(reply.dislikeCount)"
            
            bestLabel.isHidden = reply.content.contains("2") ? false : true
            contentLabelTopLayoutConstraint.constant = reply.content.contains("2") ? 21 : 8
            
            bestLabel.layer.cornerRadius = 3
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    class func height(reply: Reply) -> CGFloat {
        var height: CGFloat = 15 + 21 // top inset + username label height
        height += reply.content.contains("2") ? 21 : 8
        height += reply.content.heightWith(width: MainScreen.width - 10)
        height += (15 + 21 + 10) // bottom inset + like label height + like label top margin
        return height
    }
}

extension String {
    func heightWith(width: CGFloat) -> CGFloat {
        return (self as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)], context: nil).height
        
    }
}
