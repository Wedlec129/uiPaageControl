//
//  ContentViewController.swift
//  uiPaageControl
//
//  Created by Борух Соколов on 28.03.2023.
//

import UIKit

class ContentViewController: UIViewController {

    
    
    //тут мы сослались на обекты которые будем менять в нашем шаблоне
    @IBOutlet weak var presentLaibleText: UILabel!
    @IBOutlet weak var preseneEmoji: UILabel!
    @IBOutlet weak var pageControler: UIPageControl!
    
    //мы будем менять их в зависимости от страницы
    //но менять их будем через PageVC
    var presenText = ""
    var emoji = ""
    var currentPage = 0 // Номер текущей страницы
    var numberOfPages = 0 // Количество страниц
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentLaibleText.text = presenText
        preseneEmoji.text = emoji
        pageControler.numberOfPages = numberOfPages
        pageControler.currentPage = currentPage
        
    }
    

}
