class Car {
  String? brand, model;
  int? year;
  Car(brand, model, year) {
    print("Brand: $brand, Model: $model, Year: $year");
  }
}

void main(List<String> arguments) {
  Car car = new Car("Toyota", "Corolla", 2020);
}
