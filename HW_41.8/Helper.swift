//
//  Helper.swift
//  HW_41.8
//
//  Created by Mykhailo Romanovskyi on 25.07.2021.
//

import Foundation

struct UserUrl {
    let url: String
    let title: String
    
   static func getUrls() -> [UserUrl] {
        return [
            UserUrl.init(url: "https://ia802609.us.archive.org/23/items/Aladdin_315/Aladdin_512kb.mp4", title: "Aladdin"),
            UserUrl.init(url: "https://ia800604.us.archive.org/19/items/Avez-vousDjVu...LePlusPetitZooDuMonde/104_Le_Plus_Petit_Zoo_du_Monde.mp4", title: "Avez Vous"),
            UserUrl.init(url:  "https://ia800705.us.archive.org/28/items/TheSpiritOf43_56/The_Spirit_of__43_512kb.mp4", title: "The Kings Trumpet"),
            UserUrl.init(url: "https://ia800705.us.archive.org/28/items/TheSpiritOf43_56/The_Spirit_of__43_512kb.mp4", title:  "Popeye the Sailor Meets Aladdin and His Wonderful Lamp")
        ]
    }
}

