//
//  XMLParserHelper.swift
//  BBC
//
//  Created by GlobalTMS on 21/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

struct XMLParserStruct {
    let parentKey: String
    let childrenKeys: [String]
    let childrenDictionary: [String: String]
}

class XMLParserHelper: NSObject {
    let parser: XMLParser
    var objectList = [[String: String]]()
    let xmlParserStruct: XMLParserStruct
    var parserEndDocumentClosure: (() -> Void)?
    var currentDictionary = [String: String]()
    var currentKey = ""
    var currentValue = ""
    var isEditing = false
    
    init(_ XMLData: Data, xmlParserStruct: XMLParserStruct) {
        parser = XMLParser.init(data: XMLData)
        self.xmlParserStruct = xmlParserStruct
    }
    
    func createDictionary(_ onCompletion: @escaping () -> Void) {
        parser.delegate = self
        parserEndDocumentClosure = onCompletion
        parser.parse()
    }
    
    func parseToModel<T: ModelProtocol> () -> [T] {
        var modelList = [T]()
        
        objectList.forEach({ (dictionary) in
            modelList.append(T(dictionary))
        })
        
        return modelList
    }
}

// MARK: XMLParserDelegate
extension XMLParserHelper: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == xmlParserStruct.parentKey {
            currentDictionary = [String: String]()
            isEditing = true
        }
        
        if xmlParserStruct.childrenKeys.contains(elementName), isEditing {
            currentKey = elementName
            
            if xmlParserStruct.childrenDictionary.keys.contains(currentKey) && !attributeDict.isEmpty {
                attributeDict.keys.forEach { (key) in
                    xmlParserStruct.childrenDictionary.forEach({ (item) in
                        let (_, value) = item
                        
                        if value == key {
                            if let val = attributeDict[key] {
                                currentValue = val
                            }
                        }
                    })
                }                
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == xmlParserStruct.parentKey {
            objectList.append(currentDictionary)
            isEditing = false
        }
        
        if elementName == currentKey {
            currentDictionary[currentKey] = currentValue
            currentValue = ""
            currentKey = ""
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        if let parserEndDocumentClosure = parserEndDocumentClosure {
            parserEndDocumentClosure()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if isEditing, currentKey != "" {
            currentValue = currentValue + string
        }
    }
}
