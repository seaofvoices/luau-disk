local Disk = {
    Array = {
        all = require('./array/all'),
        alternate = require('./array/alternate'),
        any = require('./array/any'),
        average = require('./array/average'),
        averageBy = require('./array/averageBy'),
        concat = require('./array/concat'),
        copy = require('./array/copy'),
        filter = require('./array/filter'),
        find = require('./array/find'),
        findIndex = require('./array/findIndex'),
        findIndexByValue = require('./array/findIndexByValue'),
        findMap = require('./array/findMap'),
        flatMap = require('./array/flatMap'),
        flatten = require('./array/flatten'),
        fromFn = require('./array/fromFn'),
        isArray = require('./array/isArray'),
        isEmpty = require('./array/isEmpty'),
        map = require('./array/map'),
        maximum = require('./array/maximum'),
        maximumBy = require('./array/maximumBy'),
        minimum = require('./array/minimum'),
        minimumBy = require('./array/minimumBy'),
        partition = require('./array/partition'),
        pop = require('./array/pop'),
        popFirst = require('./array/popFirst'),
        product = require('./array/product'),
        productBy = require('./array/productBy'),
        push = require('./array/push'),
        range = require('./array/range'),
        reduce = require('./array/reduce'),
        reversed = require('./array/reversed'),
        sort = require('./array/sort'),
        sortByKey = require('./array/sortByKey'),
        sum = require('./array/sum'),
        sumBy = require('./array/sumBy'),
        zip = require('./array/zip'),
    },
    Map = {
        copy = require('./map/copy'),
        count = require('./map/count'),
        entries = require('./map/entries'),
        isEmpty = require('./map/isEmpty'),
        keys = require('./map/keys'),
        mapEntries = require('./map/mapEntries'),
        mapValues = require('./map/mapValues'),
        merge = require('./map/merge'),
        remove = require('./map/remove'),
        values = require('./map/values'),
    },
    None = require('./None'),
    WeakMap = require('./WeakMap'),
}

return Disk
