//
//  FavoriteView.swift
//  CoinMarket
//
//  Created by JinwooLee on 3/2/24.
//

import UIKit
import SnapKit
import Then

class FavoriteView : BaseView {
    
    lazy var favoriteCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCellLayout() ).then {
        
        $0.backgroundColor = .clear
        $0.allowsMultipleSelection = false
        $0.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
        $0.refreshControl = refreshControll
    }
    
    let refreshControll = UIRefreshControl().then {
        $0.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
    }
    
    override func configureHierarchy() {
        addSubview(favoriteCollectionView)
    }
    
    override func configureLayout() {
        favoriteCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func configureCellLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let rowCount : Double = 2
        let sectionSpacing : CGFloat = 15
        let itemSpacing : CGFloat = 15
        let width : CGFloat = UIScreen.main.bounds.width - (itemSpacing * (rowCount - 1)) - (sectionSpacing * 2)
        let itemWidth: CGFloat = width / rowCount
        
        // 각 item의 크기 설정 (아래 코드는 정사각형을 그린다는 가정)
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth)
        // 스크롤 방향 설정
        layout.scrollDirection = .vertical
        // Section간 간격 설정
        layout.sectionInset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        // item간 간격 설정
        layout.minimumLineSpacing = itemSpacing        // 최소 줄간 간격 (수직 간격)
        layout.minimumInteritemSpacing = itemSpacing   // 최소 행간 간격 (수평 간격)
        
        return layout
    }
}


