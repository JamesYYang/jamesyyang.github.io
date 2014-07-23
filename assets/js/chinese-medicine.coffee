angular.module("chineseMedicine",[])

.config(["$routeProvider",
  ($routeProvider)->
    $routeProvider.when("/",
      templateUrl: "/chinese-medicine.tpl.html"
      controller: "chineseMedicineCtrl")
])

.controller("chineseMedicineCtrl", ["$scope", ($scope)->
  sky = [
    name: "甲"
    yun: "土"
    isYang: true
  ,
    name: "乙"
    yun: "金"
    isYang: false
  ,
    name: "丙"
    yun: "水"
    isYang: true
  ,
    name: "丁"
    yun: "木"
    isYang: false
  ,
    name: "戊"
    yun: "火"
    isYang: true
  ,
    name: "己"
    yun: "土"
    isYang: false
  ,
    name: "庚"
    yun: "金"
    isYang: true
  ,
    name: "辛"
    yun: "水"
    isYang: false
  ,
    name: "壬"
    yun: "木"
    isYang: true
  ,
    name: "癸"
    yun: "火"
    isYang: false
  ]
  earth =[
    name: "子"
    qi: "少阴君火"
    order: 2
    isYang: false
    cIndex: [11,10]
  ,
    name: "丑"
    qi: "太阴湿土"
    order: 3
    isYang: false
    cIndex: [0,11]
  ,
    earth: "寅"
    qi: "少阳相火"
    order: 1
    isYang: true
    cIndex: [1,0]
  ,
    name: "卯"
    qi: "阳明燥金"
    order: 2
    isYang: true
    cIndex: [2,1]
  ,
    name: "辰"
    qi: "太阳寒水"
    order: 3
    isYang: true
    cIndex: [3,2]
  ,
    name: "巳"
    qi: "厥阴风木"
    order: 1
    isYang: false
    cIndex: [4,3]
  ,
    name: "午"
    qi: "少阴君火"
    order: 2
    isYang: false
    cIndex: [5,4]
  ,
    name: "未"
    qi: "太阴湿土"
    order: 3
    isYang: false
    cIndex: [6,5]
  ,
    name: "申"
    qi: "少阳相火"
    order: 1
    isYang: true
    cIndex: [7,6]
  ,
    name: "酉"
    qi: "阳明燥金"
    order: 2
    isYang: true
    cIndex: [8,7]
  ,
    name: "戌"
    qi: "太阳寒水"
    order: 3
    isYang: true
    cIndex: [9,8]
  ,
    name: "亥"
    qi: "厥阴风木"
    order: 1
    isYang: false
    cIndex: [10,9]
  ]
  primary = [
    start: 122
    end: 321
    name: "厥阴风木"
  ,
    start: 322
    end: 521
    name: "少阴君火"
  ,
    start: 522
    end: 721
    name: "少阳相火"
  ,
    start: 722
    end: 921
    name: "太阴湿土"
  ,
    start: 922
    end: 1121
    name: "阳明燥金"
  ,
    start: 1122
    end: 121
    name: "太阳寒水"
  ]
  generate = (date)->
    obj = {}
    obj.date = date.format("YYYY-MM-DD")
    s = getSky(date.year())
    e = getEarth(date.year())
    obj.yearString = s.name + e.name + "年"
    obj.middle = s
    obj.sky = e
    obj.water = getQuan(e)
    obj.primary = getPrimary(date)
    obj.customer = getCustom(obj)
    obj

  getSky = (year)->
    index = (year - 3) % 10
    index = 10 if index is 0
    sky[index-1]

  getEarth = (year)->
    index = (year - 3) % 12
    index = 12 if index is 0
    earth[index-1]

  getQuan = (ea)->
    item = e for e in earth when e.order is ea.order and e.isYang is !ea.isYang
    item

  getPrimary = (date)->
    index = (date.month()+1) * 100 + date.date()
    return primary[5] if index >= 1122 or index < 122
    item = p for p in primary when index >= p.start and index <= p.end
    item

  getCustom = (obj)->
    index = primary.indexOf(obj.primary)
    return obj.sky if index is 2
    return obj.water if index is 5
    if index is 0
      return earth[obj.sky.cIndex[1]]
    if index is 1
      return earth[obj.sky.cIndex[0]]
    if index is 3
      return earth[obj.water.cIndex[1]]
    if index is 4
      return earth[obj.water.cIndex[0]]


  $scope.current = generate(moment())
  $scope.select =->
    if $scope.customDate?
      $scope.userSelected = generate(moment($scope.customDate))
])