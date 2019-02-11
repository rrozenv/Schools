//
//  SchoolLenses.swift
//  Domain
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Prelude

extension School {
    public enum lens {
        public static let id = Lens<School, String>(
            view: { $0.id },
            set: { School(id: $0, name: $1.name, phoneNumber: $1.phoneNumber, city: $1.city, address: $1.address, state: $1.state) }
        )
        
        public static let name = Lens<School, String>(
            view: { $0.id },
            set: { School(id: $1.name, name: $0, phoneNumber: $1.phoneNumber, city: $1.city, address: $1.address, state: $1.state) }
        )
        
        public static let city = Lens<School, String>(
            view: { $0.id },
            set: { School(id: $1.name, name: $1.name, phoneNumber: $1.phoneNumber, city: $0, address: $1.address, state: $1.state) }
        )
        
        public static let state = Lens<School, String>(
            view: { $0.id },
            set: { School(id: $1.name, name: $1.name, phoneNumber: $1.phoneNumber, city: $1.city, address: $1.address, state: $0) }
        )
    }
}
