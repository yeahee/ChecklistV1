//
//  ChecklistItem.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 yehee. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
