//
//  net.swift
//  品茶2
//
//  Created by 弓世明 on 2017/5/19.
//  Copyright © 2017年 弓世明. All rights reserved.
//

import Foundation
import AFNetworking

class NetworkTools: AFHTTPSessionManager {
    
    /// 网络工具单例
    static let sharedTools: NetworkTools = {
        
        let tools = NetworkTools(baseURL: nil)
        
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tools
    }()
}
