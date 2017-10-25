//
//  Energy.swift
//  HAP
//
//  Created by Thomas Gustafsson on 2017-10-23.
//

import Foundation

extension Accessory {
    open class Energy: Accessory {
        public let energy = Service.Energy()
        
        public init(info: Service.Info) {
            super.init(info: info, type: .outlet, services: [energy])
        }
    }
}

extension Service {
    open class Energy: Service {
        public let on = GenericCharacteristic<Bool>(type: .on, value: false)
        public let inUse = GenericCharacteristic<Bool>(type: .outletInUse, value: true, permissions: [.read, .events])
        public let watt = GenericCharacteristic<Int>(type: .watt, value: 0, permissions: [.read, .events])
        public let kiloWattHour = GenericCharacteristic<Int>(type: .kiloWattHour, value: 0, permissions: [.read, .events])

        public init() {
            super.init(type: .outlet, characteristics: [on, inUse,watt,kiloWattHour])
        }
    }
}
