//
//  NetworkManager.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 18/10/23.
//

import Foundation

typealias WSBlock = (_ json: Any?, _ flag: Int, _ data: Data?) -> ()
typealias WSBlockError = (_ data: Data?, _ code: Int?) -> ()
typealias WSBlockCodable = (_ json: Codable?, _ flag: Int, _ data: Data?, _ headers: [AnyHashable: Any]? ) -> ()

class HttpRequests {

    var authorizationKey: String?
    var httpTask = URLSessionDataTask()
    var sessionTask = URLSession.shared
    var successBlock: (URL, HTTPURLResponse?, AnyObject?, WSBlock, Data?) -> Void
    
    init() {
        successBlock = { (relativePath, res, respObj, block, data) -> Void in
            if let response = res{
                if let _ = respObj as? NSDictionary {
                }
                if response.statusCode == 200 {
                    block(respObj, response.statusCode, data)
                }
                else {
                    block(respObj, response.statusCode,data)
                }
            } else {
                block(nil, 404, data)
            }
        }
    }

    func getHttpRequest(relPath: URL, httpMethod: String, param: [String:Any], errorBlock: @escaping () -> Void = { }, block: @escaping WSBlock) -> (){
        
        var request = URLRequest(url: relPath)
        request.httpMethod = httpMethod
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param) else { return }
        if(self.authorizationKey != nil){
            request.setValue("\(self.authorizationKey!)", forHTTPHeaderField: "Authorization")
        }

        if httpMethod != "GET" {
            request.httpBody = httpBody
            let postString = HttpRequests.getPostString(params: param)
            request.httpBody = postString.data(using: .utf8)
        }
        httpTask = sessionTask.dataTask(with:  request) { data, response, error in
            if error == nil{
                do{
                    let res = try JSONSerialization.jsonObject(with: data!, options: [.allowFragments]) as AnyObject
                    self.successBlock(relPath, response as? HTTPURLResponse, res, block, data)
                }catch{
                    self.successBlock(relPath, response as? HTTPURLResponse, nil, block, data)
                }
            }else{
                errorBlock()
            }
        }
        httpTask.resume()
        
    }

    func getHttpRequestCodable<T:Codable>(relPath: URL, httpMethod: String, param: [String:Any], type: T.Type, errorBlock: @escaping WSBlockError, block: @escaping WSBlockCodable){
        var request = URLRequest(url: relPath)
        request.httpMethod = httpMethod
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else { return }
        if(self.authorizationKey != nil){
            request.setValue("\(self.authorizationKey!)", forHTTPHeaderField: "Authorization")
        }
        if httpMethod == "POST" {
            request.httpBody = httpBody
        }else if httpMethod != "GET"{
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            request.httpBody = httpBody
        }

        httpTask = sessionTask.dataTask(with:  request) { data, response, error in
            if error == nil{
                do{
                    let s = (response as? HTTPURLResponse)
                    let jsonData = try JSONDecoder().decode(type, from: data!)
                    block(jsonData, (response as? HTTPURLResponse)?.statusCode ??  404, data, s?.allHeaderFields)
                } catch {
                    errorBlock(data, (response as? HTTPURLResponse)?.statusCode)
                }
            }else{
                errorBlock(data, (response as? HTTPURLResponse)?.statusCode)
            }
        }
        httpTask.resume()
    }

    static func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}
