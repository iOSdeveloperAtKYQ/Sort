//
//  ViewController.swift
//  Sort
//
//  Created by KK on 2020/7/7.
//  Copyright © 2020 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var array = [3,6,5,0,1]
        //MARK: - 冒泡排序
        Sort.bubbleSort(array: &array)
        
        //MARK: - 插入排序
        Sort.insertionSort(array: &array)
        
        //MARK: - 归并排序
        Sort.mergeSort(array: &array, startIdx: 0, endIdx: array.count - 1)
        
        //MARK: - 快排
        Sort.quickSore(array: &array, leftIdx: 0, rightIdx: array.count - 1)
    }


}

