//
//  Widget02082WidgetBundle.swift
//  Widget02082Widget
//
//  Created by ByteDance on 2025/2/18.
//

import WidgetKit
import SwiftUI

@main
struct WidgetLauncher {
    static func main() {
        
        //随机有没有widget，然后vid
        /* 即使传入多个WidgetBundle，也会以最后一个的widgets为准*/

        
        if firstWidgetKind == 1 {
            BookIntentWidgetBundle.main()
        }else {
            Widget02082WidgetBundle.main()
        }
//        AllWidgetBundle.main()

    }
    
    static var firstWidgetKind: Int {
    //利用App group读取第一位组件的顺序
        
        let random = Double(Int(arc4random_uniform(1000))) / 1000.0
        print("random \(random)")
        if (random > 0.5){
            print ("firstWidgetKind 1")
            return 1
        }else {
            print ("firstWidgetKind 2")
            return 2
        }
        
    }
}

struct AllWidgetBundle: WidgetBundle {
    var body: some Widget {
        BookIntentWidget()
        Widget02082Widget()
    
    }
}

struct BookIntentWidgetBundle: WidgetBundle {
    var body: some Widget {
        BookIntentWidget()
    }
}

struct Widget02082WidgetBundle: WidgetBundle {
    var body: some Widget {
        Widget02082Widget()
    }
}
