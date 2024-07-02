import 'dart:io';

void main(List<String> args) {
  int i = 1;
  do {
    stdout.write("$i, ");
    i++;
  } while (i <= 100);
  print("");
}
