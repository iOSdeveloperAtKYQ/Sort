# Sort
冒泡排序/插入排序/归并排序/快排
### 冒泡排序

```objectivec
    /// 冒泡排序
    /// - Parameter array: 数组
    class func bubbleSort(array: inout Array<Int>) {
        for i in 0 ..< array.count {
            var end = true
            for j in 0 ..< array.count - i - 1 {
                if array[j] > array[j + 1] {
                    let temp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = temp
                    end = false
                }
            }
            
            if end {
                break
            }
        }
        
    }

```
时间复杂度分析
最好情况下，要排序的数据已经是有序的了，我们只需要进行一次冒泡操作，就可以结束了，所以最好情况时间复杂度是 O(n)。而最坏的情况是，要排序的数据刚好是倒序排列的，我们需要进行 n 次冒泡操作，所以最坏情况时间复杂度为 O($n^2$)。平均时间复杂度也是 O($n^2$)。
### 插入排序

```objectivec
    /// 插入排序
    /// - Parameter array: 数组
    class func insertionSort(array: inout Array<Int>) {
        for i in 1 ..< array.count {
            //获取基准值
            let value = array[i]
            var j = i - 1; // 查找插入的位置
            while j >= 0 {
                if array[j] > value {
                    array[j+1] = array[j]
                }else {
                    break
                }
                j -= 1
            }
            //把基准值插入合适的位置
            array[j+1] = value;
        }
    }
```
时间复杂度分析
如果要排序的数据已经是有序的，我们并不需要搬移任何数据。所以这种情况下，最好时间复杂度为 O(n)。如果数组是倒序的，每次插入都相当于在数组的第一个位置插入新的数据，所以需要移动大量的数据，所以最坏情况时间复杂度为 O($n^2$)。平均时间复杂度也是 O($n^2$)。
### 归并排序

```objectivec
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
```
归并排序时间复杂度为O(nlogn)，归并排序不是原地排序算法，需要借助额外的存储空间。空间复杂度为O(n)。
### 快速排序

```objectivec
/// 快排
    /// - Parameters:
    ///   - array: 数组
    ///   - leftIdx: 左下标
    ///   - rightIdx: 右下标
    class func quickSore(array: inout Array<Int>, leftIdx: Int, rightIdx: Int) {
        if leftIdx >= rightIdx {
            return
        }
        
        var i = leftIdx
        var j = rightIdx
        //记录比较基准数
        let value = array[leftIdx]        
        while i < j {
            //首先从右边j开始查找比基准数小的值
            while i < j && array[j] >= value {
                j -= 1
            }
            //将查找到的小值调换到i的位置
            array[i] = array[j]
            
            //当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值
            while i < j && array[i] <= value {
                i += 1
            }
            //将查找到的大值调换到j的位置
            array[j] = array[i]
        }
        
        //将基准数放到正确位置
        array[i] = value
        
        /**** 递归排序 ***/
        //排序基准数左边的
        self.quickSore(array: &array, leftIdx: leftIdx, rightIdx: i - 1)
        //排序基准数右边的
        self.quickSore(array: &array, leftIdx: i + 1, rightIdx: rightIdx)
    }
```
大部分情况下的时间复杂度都可以做到 O(nlogn)，只有在极端情况下，才会退化到 O(n2)。
