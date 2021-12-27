//
//  BookStore.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/23/21.
//

import SQLite
import SQLite3

class Database{
    var conn : Connection!
    var db : OpaquePointer?
    
    //for book table
    var bookTb : Table!
    var idCol : Expression<Int>!
    var nameCol : Expression<String>!
    var authorCol : Expression<String>!
    var priceCol : Expression<Int>!
    var descriptionCol : Expression<String>!
    var categoryCol : Expression<String>!
    var imageNameCol : Expression<String>!
    var categoryidCol : Expression<Int>!
    var pdfCol : Expression<String>!
    var ratingCol : Expression<String>!
    var languageCol : Expression<String>!
    var incartCol : Expression<Int>!
    
    //for customer table
    var customerTb : Table!
    var custidCol : Expression<Int>!
    var custnameCol : Expression<String>!
    var custemailCol : Expression<String>!
    var custaddrCol : Expression<String>!
    var custnumCol : Expression<String>!
    var custpassCol : Expression<String>!
    
    //for order table
    var orderTb : Table!
    var orderidCol : Expression<Int>!
    var customeridCol : Expression<Int>!
    var bookidCol : Expression<Int>!
    var dateCol : Expression<Date>!
    var quantityCol : Expression<Int>!
    var totalCol : Expression<Int>!
    
    init() {
        
        //create table and intialize db
        self.db = initialize()
        self.createTable()
    }
    
    //get data of books
    func getbooks()-> [Bookshelf]{
        var booklist = [Bookshelf]()
        let query = "SELECT * FROM Book;"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                let author = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                let price = Int(sqlite3_column_int(statement, 3))
                let description = String(describing: String(cString: sqlite3_column_text(statement, 4)))
                let category = String(describing: String(cString: sqlite3_column_text(statement, 5)))
                let image_name = String(describing: String(cString: sqlite3_column_text(statement, 6)))
                let pdflink = String(describing: String(cString: sqlite3_column_text(statement, 7)))
                let language = String(describing: String(cString: sqlite3_column_text(statement, 8)))
                let rating = String(describing: String(cString: sqlite3_column_text(statement, 9)))
                let inCart = Int(sqlite3_column_int(statement, 10))
                
                var book = Bookshelf()
                book.id = id
                book.name = name
                book.author = author
                book.price = price
                book.description = description
                book.category = category
                book.imageName = image_name
                book.pdflink = pdflink
                book.language = language
                book.rating = rating
                book.incart = inCart
                
                booklist.append(book)
            }
        }
        return booklist
    }
    
    //get data from customer table
    func getcustomer(email: String)-> String{
        var password = ""
        //var email1 = "\"\(email)\""
        let query = "SELECT * FROM Customer"
        print(email)
                var statement : OpaquePointer? = nil
                if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
                     while(sqlite3_step(statement) == SQLITE_ROW)  {
                        let email1 = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                         print(email1)
                         if(email1 == email){
                             print("data found")
                             password = String(describing: String(cString: sqlite3_column_text(statement, 5)))
                             print(password)
                             return password
                         }
                    }
                }
        return password
    }
    
    //for insert table
    //to insert into book table
    func insertbookTable(id : Int, name: String, author: String, price: Int, description: String, category: String, image_name: String, pdflink: String, language: String, rating: String, incart: Int){
        let query = "INSERT INTO Book(id, name, author, price, description, category, image_name, pdflink, language, rating) VALUES (?,?,?,?,?,?,?,?,?,?)"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_int(statement, 1, Int32(id))
            sqlite3_bind_text(statement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (author as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, Int32(price))
            sqlite3_bind_text(statement, 5, (description as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 6, (category as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 7, (image_name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 8, (pdflink as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 9, (language as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 10, (rating as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 11, Int32(incart))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data inserted successfully")
            }else {
                print("Data is not inserted in table")
            }
        }else {
            print("Query is not as per requirement")
        }
    }
    
    //to insert into customer table
    func insertcustomerTable(name: String, email: String, address: String, number: String, password: String){
        let query = "INSERT INTO Customer(id, name, email, address, number, password) VALUES (?,?,?,?,?,?)"
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
            //sqlite3_bind_int(statement, 1, Int32(id))
            sqlite3_bind_text(statement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (address as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 5, (number as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 6, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Data inserted successfully")
            }else {
                print("Data is not inserted in table")
            }
        }else {
                print("Query is not as per requirement")
        }
    }
    
    //for table creation
    func createTable() {
        let query = "CREATE TABLE IF NOT EXISTS Book(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, author TEXT, price INTEGER, description TEXT, category TEXT, image_name TEXT, pdflink TEXT, language TEXT, rating TEXT, incart INT);"
        let query1 = "CREATE TABLE IF NOT EXISTS Customer(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, address TEXT, number TEXT, password TEXT);"
        let query2 = "CREATE TABLE IF NOT EXISTS Order(id INTEGER PRIMARY KEY AUTOINCREMENT, bookid INTEGER, customerid INTEGER, date DATE, quantity INTEGER, total INTEGER, FOREIGN KEY (bookid) REFERENCES Book(id), FOREIGN KEY (customerid) REFERENCES Customer(id));"
        
        var createTable : OpaquePointer? = nil
        
        //book table creation
        if sqlite3_prepare(self.db, query, -1, &createTable, nil) == SQLITE_OK {
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("Book Table created")
            }else{
                print("Table creation failed")
            }
        }else{
            print("Preparation fail")
        }
        
        //customer table creation
        if sqlite3_prepare(self.db, query1, -1, &createTable, nil) == SQLITE_OK {
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("Customer Table created")
            }else{
                print("Table creation failed")
            }
        }else{
            print("Preparation fail")
        }
        
        //Order table creation
        if sqlite3_prepare(self.db, query2, -1, &createTable, nil) == SQLITE_OK {
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("Order Table created")
            }else{
                print("Table creation failed")
            }
        }else{
            print("Preparation fail")
        }
    }
    
    func initialize() -> OpaquePointer? {
        //book table
        bookTb = Table("book")
        idCol = Expression<Int>("id")
        nameCol = Expression<String>("name")
        authorCol = Expression<String>("author")
        priceCol = Expression<Int>("price")
        descriptionCol = Expression<String>("description")
        categoryCol = Expression<String>("category")
        imageNameCol = Expression<String>("image_name")
        pdfCol = Expression<String>("pdflink")
        incartCol = Expression<Int>("incart")
        
        //customer table
        customerTb = Table("customer")
        custidCol = Expression<Int>("id")
        custnameCol = Expression<String>("name")
        custemailCol = Expression<String>("email")
        custaddrCol = Expression<String>("address")
        custnumCol = Expression<String>("number")
        custpassCol = Expression<String>("password")
        
        //order table
        orderTb = Table("order")
        orderidCol = Expression<Int>("id")
        customeridCol = Expression<Int>("customerid")
        bookidCol = Expression<Int>("bookid")
        dateCol = Expression<Date>("date")
        quantityCol = Expression<Int>("quantity")
        totalCol = Expression<Int>("total")
        
        let rootPath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbPath = rootPath.appendingPathComponent("myDB1.sqlite").path
        print("Sqlite database location: \(dbPath)")
        
        var db : OpaquePointer? = nil
        // Create/open the database connection
        conn = try! Connection(dbPath)
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            print("Error in db creation")
            return nil
        }else{
            print("Database is created successfully")
            return db
        }
    }
    
}

//singleton object
class CustomerStore{
    static private var instance : CustomerStore!
    var database = Database()
    
    static func get() -> CustomerStore {
        if instance == nil {
            instance = CustomerStore()
        }
        return instance
    }
    
    func createCustomer(customerObj : Customer){
        let conn = database.conn!
        let tb = database.customerTb!
        let insStmt = tb.insert(database.custidCol <- customerObj.id, database.custnameCol <- customerObj.name, database.custemailCol <- customerObj.email, database.custaddrCol <- customerObj.address, database.custnumCol <- customerObj.number, database.custpassCol <- customerObj.password)
        try! conn.run(insStmt)
    }
}

//singleton object
class BookStore : ObservableObject{
    static private var instance : BookStore!
    var database = Database()
    
    static func get() -> BookStore {
        if instance == nil {
            instance = BookStore()
        }
        return instance
    }
    
    func createBook(bookObj : Bookshelf){
        let conn = database.conn!
        let tb = database.bookTb!
        let insStmt = tb.insert(database.idCol <- bookObj.id, database.nameCol <- bookObj.name, database.authorCol <- bookObj.author, database.priceCol <- bookObj.price, database.descriptionCol <- bookObj.description, database.categoryCol <- bookObj.category, database.imageNameCol <- bookObj.imageName)
        try! conn.run(insStmt)
    }
    
}
