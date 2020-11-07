//
//  FolderType.swift
//  Todo
//
//  Created by 박주성 on 10/24/20.
//  Copyright © 2020 sdop. All rights reserved.
//

import Foundation

// fodler 개념에 type을 추가한다. inbox, normal, trash
// inbox 및 trash 타입은 c가 한 번만 되어야한다. ud는 안되어야함 --> 테스트 코드 작성 요망
public enum FolderType: String {
    case inbox
    case normal
    case trash
}
