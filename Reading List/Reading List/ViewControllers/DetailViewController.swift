//
//  DetailViewController.swift
//  Reading List
//
//  Created by Lisa Sampson on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
            let reasonToRead = reasonToReadTextView.text else { return }
        
        if let book = book {
            bookController?.updateBookTitleandReason(book: book, title: title, reasonToRead: reasonToRead)
        } else {
            bookController?.create(title: title, reasonToRead: reasonToRead)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        if let book = book {
            navigationController?.title = book.title
            titleTextField.text = book.title
            reasonToReadTextView.text = book.reasonToRead
        } else {
            navigationController?.title = "Add New Book"
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    var bookController: BookController?
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
}
