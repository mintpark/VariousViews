//
//  ReplyViewController.swift
//  VariousViews
//
//  Created by Hayoung Park on 2018. 4. 29..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var replys = [Reply]()
    var webtoon: Webtoon? {
        didSet {
            guard let webtoon = webtoon else { return }
            self.replys = createReplys(webtoon: webtoon)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ReplyTableViewCell", bundle: nil), forCellReuseIdentifier: "ReplyTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func createReplys(webtoon: Webtoon) -> [Reply] {
        let replys = [
            Reply(userName: "Alie", content: String(format: "%@의 1번째 댓글", webtoon.name), likeCount: webtoon.name.count * 2, dislikeCount: webtoon.name.count),
            Reply(userName: "Bob", content: String(format: "%@의 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 2번째 댓글 ", webtoon.name), likeCount: webtoon.name.count * 2, dislikeCount: webtoon.name.count),
            Reply(userName: "Ciao", content: String(format: "%@의 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글 3번째 댓글", webtoon.name), likeCount: webtoon.name.count * 2, dislikeCount: webtoon.name.count),
        ]
        return replys
    }

}

extension ReplyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyTableViewCell", for: indexPath) as? ReplyTableViewCell else { return UITableViewCell() }
        cell.reply = replys[indexPath.row]
        
        return cell   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ReplyTableViewCell.height(reply: replys[indexPath.row])
    }
}
