//
//  Note.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: String
    let title: String
    let note: String
    let createDate: TimeInterval
}
