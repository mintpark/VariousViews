//
//  ListViewController.swift
//  VariousViews
//
//  Created by Hayoung Park on 2018. 4. 29..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

struct Webtoon {
    var name: String
    var subtitle: String
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var webtoonList: [Webtoon] = [
        Webtoon(name: "유미의 세포들", subtitle: "우당탕탕 세포틀"),
        Webtoon(name: "하이브3", subtitle: "원시대기 상태의 지구"),
        Webtoon(name: "아기 낳는 만화", subtitle: "무시무시한 임신"),
        Webtoon(name: "덴마", subtitle: "SF모험극"),
        Webtoon(name: "계룡선녀전", subtitle: "699세 계룡산 선녀님, 서방님 찾아 도시로 상경!"),
        Webtoon(name: "용이산다", subtitle: "일상 판타지"),
        Webtoon(name: "선천적 얼간이들", subtitle: "좌충우돌 라이프"),
        Webtoon(name: "슈퍼 시크릿", subtitle: "평범한 여대생 은호와 조금 특별한 소꿉친구 견우의 알콩달콩 러브스토리")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 65
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell else { return UITableViewCell() }
        cell.webtoon = webtoonList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webtoonList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let replyVC = ReplyViewController(nibName: "ReplyViewController", bundle: nil)
        replyVC.webtoon = webtoonList[indexPath.row]
        
        self.navigationController?.pushViewController(replyVC, animated: true)
    }
}

class ListTableViewCell: UITableViewCell {
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    
    var webtoon: Webtoon? {
        didSet {
            guard let webtoon = webtoon else { return }
            
            titleLabel.text = webtoon.name
            subTitleLabel.text = webtoon.subtitle
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: MainScreen.width - 20, height: 20))
        subTitleLabel = UILabel(frame: CGRect(x: 10, y: 35, width: MainScreen.width - 20, height: 20))
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subTitleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainScreen {
    static var height: CGFloat = UIScreen.main.bounds.height
    static var width: CGFloat = UIScreen.main.bounds.width
}
