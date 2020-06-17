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
        rate: "303 SR",

        priceperday:"21",
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Patented Scaffolding',
      image: 'assets/images/steelscaffolding.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
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
        rate: "203 SR",

        priceperday:"21",
        days: '30 days',
        description: 'Lorem Impsum',
      )
  ),
];


var dummyBuildingMaterial = [
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/Sand 1.png',
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
      image: 'assets/images/Sand 2.png',
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
      image: 'assets/images/Sand 4.png',
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
      image: 'assets/images/Sand 5.png',
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
      image: 'assets/images/Sand 6.png',
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
      image: 'assets/images/Sand 7.png',
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
      image: 'assets/images/Item 1.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        description: 'Lorem Impsum',
        rate: "203 SR",

        priceperday:"21",
      )
  ),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/Item 2.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        rate: "203 SR",

        priceperday:"21",
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Mapei',
      image: 'assets/images/Item 3.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        description: 'Lorem Impsum',
        rate: "203 SR",

        priceperday:"21 ",
      )
  ),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/Item 4.png',
      detail: ConstructionServiceDetail(
        sr: '345',
        days: '10 days',
        rate: "203 SR",

        priceperday:"21",
        description: 'Lorem Impsum',
      )
  ),
  ConstructionService(
      title: 'Cement & Gypsum',
      image: 'assets/images/Item 5.png',
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