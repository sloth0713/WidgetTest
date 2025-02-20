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
//        if firstWidgetKind == "Widget02082WidgetBundle" { //热榜第一
//            Widget02082WidgetBundle1.main()
//        } else {
//            Widget02082WidgetBundle.main()
//        }
        //随机有没有widget，然后vid
        Widget02082WidgetBundle.main()
    }
    static var firstWidgetKind: String {
    //利用App group读取第一位组件的顺序
        return "Widget02082WidgetBundle"
    }
}

struct Widget02082WidgetBundle1: WidgetBundle {
    var body: some Widget {

        Widget02082Widget()
        //启动之后会调用这里
//        WidgetBundleBuilder.buildBlock()
        
    }
}

struct Widget02082WidgetBundle: WidgetBundle {
    var body: some Widget {

        Widget02082Widget()
        //启动之后会调用这里
//        WidgetBundleBuilder.buildBlock()
        
    }
}
