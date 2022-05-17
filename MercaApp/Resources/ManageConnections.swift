//
//  ManageConnections.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.

import Foundation

typealias WSBlock = (_ json: Any?, _ flag: Int, _ data: Data?) -> ()
typealias WSBlockError = (_ data: Data?, _ code: Int?) -> ()
typealias WSBlockCodable = (_ json: Codable?, _ flag: Int, _ data: Data?, _ headers: [AnyHashable: Any]? ) -> ()

class HttpRequests {
    
    var authorizationKey: String?
    var httpTask = URLSessionDataTask()
    var sessionTask = URLSession.shared
    var successBlock: (URL, HTTPURLResponse?, AnyObject?, WSBlock, Data?) -> Void
    //  var errorBlock: (String, HTTPURLResponse?, NSError, WSBlock) -> Void
    
    init() {
        successBlock = { (relativePath, res, respObj, block, data) -> Void in
            // Check for response it should be there as it had come in success block
            if let response = res{
                print("Response Code: \(response.statusCode)")
                if let _ = respObj as? NSDictionary {
                    //                    print(dictResponse)
                }
                if response.statusCode == 200 {
                    block(respObj, response.statusCode, data)
                }
                else {
                    block(respObj, response.statusCode,data)
                }
            } else {
                // There might me no case this can get execute
                block(nil, 404, data)
            }
        }
        
        
    }
    
    func getHttpRequest(relPath: URL, httpMethod: String, param: [String:Any], errorBlock: @escaping () -> Void = { }, block: @escaping WSBlock) -> (){
        
        var request = URLRequest(url: relPath)
        request.httpMethod = httpMethod
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param) else { return }
        print("Parametros: \(String(data: httpBody, encoding: .utf8) ?? "Without data")" )
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
                    
                    print("JSON:\(res)")
                }catch let errParse{
                    print("Catch: \(errParse)")
                    self.successBlock(relPath, response as? HTTPURLResponse, nil, block, data)
                }
            }else{
                print(error!)
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
        print("Parametros: \(String(data: httpBody, encoding: .utf8) ?? "Without data")" )
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
                }catch let errParse{
                    print(errParse.localizedDescription)
                    errorBlock(data, (response as? HTTPURLResponse)?.statusCode)
                }
                print(String(data: data!, encoding: .utf8) ?? "")
            }else{
                print(error!)
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
