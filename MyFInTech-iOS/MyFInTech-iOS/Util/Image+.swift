//
//  Image+.swift
//  MyFInTech-iOS
//
//  Created by 강인혜 on 5/30/24.
//

import UIKit

func convertCopany(_ company: String) -> UIImage {
    switch company {
    case "광주은행", "전북은행":
        return .광주은행
    case "신한은행", "제주은행":
        return .신한은행
    case "우리은행":
        return .우리은행
    case "카카오뱅크":
        return .카카오뱅크
    case "하나은행":
        return .하나은행
    case "경남은행", "부산은행":
        return .BNK
    case "IBK기업은행":
        return .ibk기업은행
    case "KB국민은행":
        return .kb국민은행
    case "NH농협은행":
        return .nh농협은행
    default:
        return UIImage(systemName: "circle.fill") ?? .init()
    }
}
