import 'package:haweyati/src/utlis/const.dart';

class ConstructionService {
  String image;
  String title;
  ConstructionServiceDetail detail;
  ConstructionService({this.image,this.title,this.detail});
}

class ConstructionServiceDetail {
  String sr;
  String quantity;
  String days;
  String description;
 String rate;
 String priceperday;

  ConstructionServiceDetail({this.quantity, this.days ,this.rate,this.priceperday,this.description,this.sr});
}

  var dummyDumpster  = [
      ConstructionService(
      title: '20 Yard Dumpster',
      image: 'assets/images/dumpster.png',
      detail: ConstructionServiceDetail(
      sr: '345',
      days: '10 days',

        rate: "203 SR",
        quantity: "2",

        priceperday:"21",

        description: 'Lorem Impsum',
    )
  ),
    ConstructionService(
    title: '12 Yard Dumpster',
    image: 'assets/images/dumpster-12.png',
      detail: ConstructionServiceDetail(
        sr: '345',

        rate: "203 SR",

        priceperday:"21",
        quantity: "6",        days: '10 days',
        description: 'Lorem Impsum',
      )
  ),
];


var dummyScaffolding = [
  ConstructionService(
      title: 'Steel Scaffolding',
      image: 'assets/images/steelscaffolding.png',
      detail: ConstructionServiceDetail(
        sr: '',
        days: '10 days',
        quantity: "9",
        rate: "303 ",

        priceperday:"21",
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Patented Scaffolding',
      image: 'assets/images/steelscaffolding.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 ',
        quantity:"13",

        rate: "203 SR",

        priceperday:"21",
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Single Scaffolding',
      image: 'assets/images/steelscaffolding.png',
      detail: ConstructionServiceDetail(
        sr: '303',
        quantity: "3",
        rate: "203 ",

        priceperday:"21",
        days: '30 days',
        description: 'Lorem Impsum',
      )
  ),
];


var dummyBuildingMaterial = [
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/sand-1.png',
      detail: ConstructionServiceDetail(
        quantity: "7",
        rate: "203 SR",

        priceperday:"21",
        sr: '202',
        days: '6 days',
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Sand',
      image: 'assets/images/sand-2.png',
      detail: ConstructionServiceDetail(
        sr: '369',
        days: "per 19 days"
        ,
        quantity: "1",     rate: "203 SR",

        priceperday:"21",
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Gravel',
      image: 'assets/images/sand-4.png',
      detail: ConstructionServiceDetail(
        sr: '560',
        rate: "203 SR",
        quantity: "3",
        priceperday:"21",
        days: '22 days',
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Gravel',
      image: 'assets/images/sand-5.png',
      detail: ConstructionServiceDetail(
        sr: '560',
        rate: "203 SR",

        priceperday:"21",
        days: '22 days',
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Gravel',
      image: 'assets/images/sand-6.png',
      detail: ConstructionServiceDetail(
        sr: '560',
        rate: "203 SR",

        priceperday:"21 ",
        days: '22 days',
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Gravel',
      image: 'assets/images/sand-7.png',
      detail: ConstructionServiceDetail(
        sr: '560',
        rate: "203 SR",

        priceperday:"21",
        days: '22 days',
        description: 'Lorem Impsum',
      )
  ),];

var dummyFinishingMaterial = [
  ConstructionService(
      title: 'Mapei',
      image: 'assets/images/item-1.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        description: loremIpsum.substring(0,35),
        rate: "203 SR",

        priceperday:"21",
      )
  ),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/item-2.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        rate: "203 SR",

        priceperday:"21",
        description: loremIpsum.substring(0,35),
      )
  ),
  ConstructionService(
      title: 'Mapei',
      image: 'assets/images/item-3.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        description: loremIpsum.substring(0,35),
        rate: "203 SR",

        priceperday:"21 ",
      )
  ),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/item-4.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        rate: "203 SR",

        priceperday:"21",
        description: loremIpsum.substring(0,35),
      )
  ),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/item-5.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        rate: "203 SR",

        priceperday:"21 ",
        description: 'Lorem Impsum',
      )
  ),
];

var dummyVehicles = [
  ConstructionService(
      title: 'Truck',
      image: 'assets/images/building.png'
 , detail: ConstructionServiceDetail(
    sr: '345',
    days: '10 days',
    rate: "203 SR",

    priceperday:"21 ",
    description: 'Lorem Impsum',
  ) ),
  ConstructionService(
      title: 'Loader',
      image: 'assets/images/building.png'
  , detail: ConstructionServiceDetail(
    sr: '345',
    days: '10 days',
    rate: "203 SR",

    priceperday:"21",
    description: 'Lorem Impsum',
  )),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/building.png'
  , detail: ConstructionServiceDetail(
    sr: '345',
    days: '10 days',
    rate: "203 SR",

    priceperday:"21",
    description: 'Lorem Impsum',
  )),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/building.png'
  , detail: ConstructionServiceDetail(
    sr: '345',
    days: '10 days',
    rate: "203 SR",

    priceperday:"21",
    description: 'Lorem Impsum',
  )),
];