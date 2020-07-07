//
//  Sort.swift
//  Sort
//
//  Created by KK on 2020/7/7.
//  Copyright © 2020 K. All rights reserved.
//

import UIKit

class Sort: NSObject {
    
    /// 冒泡排序
    /// - Parameter array: 数组
    class func bubbleSort(array: inout Array<Int>) {
        for i in 0 ..< array.count {
            print("外循环第\(i + 1)次，原数组\(array)")
            var end = true
            for j in 0 ..< array.count - i - 1 {
//                print("内循环第\(j)次")
                //比较相邻的两个值，如果前面的值比后面的值大就互换位置
                if array[j] > array[j + 1] {
                    print("前面的值比后面的值大，下标为\(j)的\(array[j])和下标为\(j + 1)的\(array[j + 1])交换位置")
                    let temp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = temp
                    end = false
                    print("交换后\(array)")
                }
            }
            
            if end {
                print("提前退出循环")
                break
            }
        }
        
    }
    
    
    /// 插入排序
    /// - Parameter array: 数组
    class func insertionSort(array: inout Array<Int>) {
        print("原数组\(array)")
        for i in 1 ..< array.count {
            //获取基准值
            let value = array[i]
            print("基准值\(value)")
            var j = i - 1; // 查找插入的位置
            while j >= 0 {
                if array[j] > value {
                    //前面的值比基准值大，把这个值赋值给后一个元素
                    print("修改入前\(array)，\(array[j])的值比基准值大,把\(array[j])赋值给后面的\(array[j+1])")
                    array[j+1] = array[j]
                    print("修改入后\(array)")
                }else {
                    break
                }
                j -= 1
            }
            //把基准值插入合适的位置
            print("插入前\(array)，把基准值\(value)插入下标为\(j+1)的位置")
            array[j+1] = value;
            print("插入后\(array)")
        }
    }
    
    
    /// 归并排序
    /// - Parameters:
    ///   - array: 数组
    ///   - startIdx: 开始坐标
    ///   - endIdx: 结束坐标
    class func mergeSort(array: inout Array<Int>, startIdx: Int, endIdx: Int) {
        if array.count == 0 || startIdx >= endIdx {
            return
        }
        
        let midIdx = (startIdx + endIdx) / 2
        self.mergeSort(array: &array, startIdx: startIdx, endIdx: midIdx)
        self.mergeSort(array: &array, startIdx: midIdx + 1, endIdx: endIdx)
        self.merge(array: &array, startIdx: startIdx, midIdx: midIdx, endIdx: endIdx)
    }
    
    /// 数组排序
    class func merge(array: inout Array<Int>, startIdx: Int, midIdx: Int, endIdx: Int) {
        //创建一个临时数组
        var tempArray = Array<Int>.init()
        var i = startIdx  // 第1个有序区的起始索引
        var j = midIdx + 1 // 第2个有序区的起始索引
        
        while i <= midIdx && j <= endIdx {
            //把小的值加到临时数组前面
            if array[i] < array[j] {
                tempArray.append(array[i])
                i += 1
            }else {
                tempArray.append(array[j])
                j += 1
            }
            
        }
        
        while i <= midIdx {
            // 把第1个有序区剩余的数据加入到临时数组中
            tempArray.append(array[i])
            i += 1
        }
        
        while j <= endIdx {
            // 把第2个有序区剩余的数据加入到临时数组中
            tempArray.append(array[j])
            j += 1
        }
        
        // 将排序后的元素，全部都整合到数组array中
        for (idx, value) in tempArray.enumerated() {
            array[startIdx + idx] = value
        }
    }
    
    
    /// 快排
    /// - Parameters:
    ///   - array: 数组
    ///   - leftIdx: 左下标
    ///   - rightIdx: 右下标
    //一趟快速排序的步骤：
    //1）设置两个变量i、j，排序开始的时候：i=0，j=N-1；
    //2）以第一个数组元素作为关键数据，赋值给key，即key=Array[0]；
    //3）从j开始向前搜索，即由后开始向前搜索(j--)，找到第一个小于等于key的值Array[j]，将Array[j]的值赋给Array[i]；
    //4）从i开始向后搜索，即由前开始向后搜索(i++)，找到第一个大于等于key的值Array[i]，将Array[i]的值赋给Array[j]；
    //5）重复第3、4步，直到i=j；(3,4步中，没找到符合条件的值，即3中A[j]不小于key,4中A[i]不大于key的时候改变j、i的值，使得j=j-1，i=i+1，直至找到为止。找到符合条件的值，进行交换的时候i， j指针位置不变。另外，i==j这一过程一定正好是i+或j-完成的时候，此时令循环结束）。
    class func quickSore(array: inout Array<Int>, leftIdx: Int, rightIdx: Int) {
        if leftIdx >= rightIdx {
            return
        }
        
        var i = leftIdx
        var j = rightIdx
        //记录比较基准数
        let value = array[leftIdx]
        print("基准数\(value)，左下标从\(leftIdx)开始,右下标从\(rightIdx)开始\n")
        
        while i < j {
            //首先从右边j开始查找比基准数小的值
            while i < j && array[j] >= value {
                j -= 1
            }
            print("从后开始向前搜索，找到第一个小于等于比较基准数的值，左下标i为\(i),右下标j为\(j)")
            print("替换前\(array),将右下标j为\(j)的值\(array[j])赋值给左下标i为\(i)的值\(array[i])")
            //将查找到的小值调换到i的位置
            array[i] = array[j]
            print("替换后\(array)\n")
            
            
            //当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值
            while i < j && array[i] <= value {
                i += 1
            }
            print("从前开始向后搜索，找到第一个大于等于比较基准数的值，左下标i为\(i),右下标j为\(j)")
            print("替换前\(array),将左下标i为\(i)的值\(array[i])赋值给右下标j为\(j)的值\(array[j])替换")
            //将查找到的大值调换到j的位置
            array[j] = array[i]
            print("替换后\(array)\n\n")
        }
        
        //将基准数放到正确位置
        array[i] = value
        print("将基准数\(value)放到左下标为\(i)位置后\(array)")

        /**** 递归排序 ***/
        //排序基准数左边的
        self.quickSore(array: &array, leftIdx: leftIdx, rightIdx: i - 1)
        //排序基准数右边的
        self.quickSore(array: &array, leftIdx: i + 1, rightIdx: rightIdx)
    }
    
}
