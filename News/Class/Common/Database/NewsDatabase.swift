//
//  NewsDatabase.swift
//  News
//
//  Created by Yang on 2019/10/29.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import SQLite

struct NewsDatabase {
    var database: Connection!
    
    init() {
        self.connection()
    }
    
    private mutating func connection() {
        do {
            let path = NSHomeDirectory() + "/Documents/news.db"
            /// 创建数据库
            try self.database = Connection(path)
            
            /// 创建分类表
            try self.database.run(categoryTable.create( ifNotExists: true, block: { t in
                t.column(categoryField, primaryKey: true)
                t.column(nameField)
                t.column(flagsField)
                t.column(iconUrlField)
                t.column(webUrlField)
                t.column(typeField)
                t.column(stickField)
                t.column(selectedField)
            }))
        } catch {
            print(error)
            self.database = nil
        }
    }
    
    // MARK: 分类表
    let categoryTable = Table("category")
    
    let categoryField = Expression<String>("category")
    let nameField = Expression<String>("name")
    let flagsField = Expression<Int64>("flags")
    let iconUrlField = Expression<String>("icon_url")
    let webUrlField = Expression<String>("web_url")
    let typeField = Expression<Int64>("type")
    let stickField = Expression<Int64>("stick")
    let selectedField = Expression<Bool>("selected")
}

// MARK: - 分类
extension NewsDatabase {

    func insert(_ categories: [Category]) {
        for item in categories {
            let insert = self.categoryTable.insert(categoryField <- item.category, nameField <- item.name, flagsField <- Int64(item.flags), iconUrlField <- item.icon_url, webUrlField <- item.web_url, typeField <- Int64(item.type), stickField <- Int64(item.stick), selectedField <- item.isSelected)
            
            do {
                try self.database.run(insert)
            } catch  {
                print(error)
            }
        }
    }
    
    func update(_ category: Category) {
        let alice = self.categoryTable.filter(categoryField == category.category)
        let update = alice.update(nameField <- category.name, flagsField <- Int64(category.flags), iconUrlField <- category.icon_url, webUrlField <- category.web_url, typeField <- Int64(category.type), stickField <- Int64(category.stick), selectedField <- category.isSelected)
        
        do {
            try self.database.run(update)
        } catch {
            print(error)
        }
    }
    
    func setSelected(_ id: String, selected: Bool) {
        let alice = self.categoryTable.filter(categoryField == id)
        let update = alice.update(selectedField <- selected)
        do {
            try self.database.run(update)
        } catch {
            print(error)
        }
    }
    
    func findByCategory(_ cat: String) -> Category? {
        let alice = self.categoryTable.filter(categoryField == cat)
        do {
            let query = try self.database.prepare(alice)
            for item in query {
                return Category(category: item[categoryField], name: item[nameField], flags: Int(item[flagsField]), icon_url: item[iconUrlField], web_url: item[webUrlField], type: Int(item[flagsField]), stick: Int(item[stickField]), isSelected: item[selectedField])
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func listAll() -> [Category] {
        var categories = [Category]()
        do {
            let result = try self.database.prepare(categoryTable)
            for item in result {
                let cat = Category(category: item[categoryField], name: item[nameField], flags: Int(item[flagsField]), icon_url: item[iconUrlField], web_url: item[webUrlField], type: Int(item[flagsField]), stick: Int(item[stickField]), isSelected: item[selectedField])
                categories.append(cat)
            }
        } catch {
            print(error)
        }
        
        return categories
    }
}
