//
//  TypeSelectionView.swift
//  MyFInTech-iOS
//
//  Created by 강인혜 on 6/1/24.
//

import UIKit
import RxSwift
import RxCocoa
import FlexLayout
import PinLayout

class TypeSelectionView: UICollectionReusableView {
    var types: [String] = []
    var selected =  BehaviorRelay<Int>(value: 0)
    let disposeBag = DisposeBag()
    
    private lazy var segmentControl: UISegmentedControl = {
        $0.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.gray4,
                .font: UIFont.pretendard(.Medium, 18)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.segment,
                .font: UIFont.pretendard(.Medium, 18)
            ],
            for: .selected
        )
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(
            UIImage(),
            forLeftSegmentState: .selected,
            rightSegmentState: .normal,
            barMetrics: .default
        )
        $0.apportionsSegmentWidthsByContent = true
        return $0
    }(UISegmentedControl())
    private let underlineView: UIView = {
        $0.backgroundColor = .gray1
        return $0
    }(UIView())
    
    init() {
        super.init(frame: .zero)
        
        self.flex
            .direction(.row)
            .define {
                $0.addItem(segmentControl)
                $0.addItem(underlineView)
            }
        
        segmentControl.rx.selectedSegmentIndex
            .bind(to: self.selected)
            .disposed(by: disposeBag)
        
        selected.subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.types.enumerated().forEach {
            self.segmentControl.insertSegment(withTitle: $1, at: $0, animated: true)
            segmentControl.selectedSegmentIndex = 0
        }
        
        self.flex.layout()
        self.pin.height(40)
        segmentControl.pin.all()
        underlineView.pin
            .below(of: segmentControl)
            .height(1)
            .horizontally()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TypeSelectionView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let typeSelectionView = TypeSelectionView()
            typeSelectionView.types = ["정기적금", "자유적금", "청년적금", "청년도약계좌", "주택청약통장", "군인적금"]
            return typeSelectionView
        }
    }
}
#endif
