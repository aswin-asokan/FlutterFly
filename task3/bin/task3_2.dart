class Animal {
  void makeSound() {
    print("Sound");
  }
}

class Dog {
  void makeSound() {
    print("Bark");
  }
}

void main(List<String> args) {
  Dog d = new Dog();
  d.makeSound();
}
