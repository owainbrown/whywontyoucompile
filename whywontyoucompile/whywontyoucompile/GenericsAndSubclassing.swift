//
//  GenericsAndSubclassing.swift
//  whywontyoucompile
//
//  Created by Owain Brown on 06/06/2018.
//  Copyright © 2018 bythecshore. All rights reserved.
//

import Foundation
import UIKit

protocol SomethingGeneric {
    associatedtype Associated

    var property: Associated { get set }
}

protocol VirtualAssociated {
    func exampleMethod()
}

struct ConcreteAssociated: VirtualAssociated {
    func exampleMethod() {
        
    }
}

class Super: UIViewController, SomethingGeneric {
    var property: VirtualAssociated
    
    init(_ associated: VirtualAssociated) {
        self.property = associated
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Subclass: Super {
    var property: ConcreteAssociated
    
    init(_ associated: ConcreteAssociated) {
       super.init(associated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

